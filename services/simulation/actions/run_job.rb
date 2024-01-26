# frozen_string_literal: true

module Simulation
  module Actions
    class RunJob < Simulation::Action
      include Deps['actions.run_job.contract']
      include Deps['messages.save_job_logs_message']
      include Deps['messages.next_job_run_message']
      include Garnet::Utils::PrettyPrint

      protected

      def handle(params)
        job = params[:job]
        job_logs = job.run
        logger.info "Rendered #{job_logs.size} job logs for #{job.name}"
        save_job_logs_message.deliver!(job_logs:).fmap do |_r|
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
