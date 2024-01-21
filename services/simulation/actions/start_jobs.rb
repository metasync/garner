# frozen_string_literal: true

module Simulation
  module Actions
    class StartJobs < Simulation::Action
      include Deps['actions.start_jobs.contract']
      include Deps['messages.next_job_run_message']

      protected

      def handle(params)
        params[:jobs].each do |job|
          next_job_run_message.deliver!(
            job: Simulation::Job.new(**job)
          )
          logger.info "Scheduled job #{job[:name]}"
        end
      end
    end
  end
end
