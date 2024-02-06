# frozen_string_literal: true

module Simulation
  module Actions
    class StartJobs < Simulation::Action
      include Deps['jobs']
      include Deps['messages.next_job_run_message']

      protected

      def handle(_params)
        jobs.each { |job| start_job(job) }
      end

      def start_job(job)
        next_job_run_message.deliver!(job:)
        logger.info "Scheduled simulation job #{job.name}"
      end
    end
  end
end
