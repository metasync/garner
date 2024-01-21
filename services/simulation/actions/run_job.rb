# frozen_string_literal: true

module Simulation
  module Actions
    class RunJob < Simulation::Action
      include Deps['actions.run_job.contract']
      include Deps['messages.save_job_log_message']
      include Deps['messages.next_job_run_message']
      include Garnet::Utils::PrettyPrint

      protected

      def handle(params)
        job = params[:job]
        job_log = job.run
        logger.debug "Rendered job log for #{job.name}:\n#{pretty_inspect(job_log)}"
        save_job_log_message.deliver!(job_log:).fmap do |_r|
          if job.max_batches_reached?
            logger.info "Completed simulation for #{job.name}"
          else
            schedule_next_job_run(job)
          end
        end
      end

      def schedule_next_job_run(job)
        sleep job.batch_wait
        next_job_run_message.deliver!(job:)
        logger.info "Scheduled next job run for #{job.name}"
      end
    end
  end
end
