# frozen_string_literal: true

module Elastic
  module Actions
    class IntakeJobLogs < Elastic::Action
      include Deps['actions.intake_job_logs.contract']

      protected

      def handle(params)
        slice = params[:slice]
        job_logs = params[:job_logs]
        logger.info "[Slice##{slice}] Transformed #{job_logs.size} job logs to Elastic APM entries"
        slice
      end
    end
  end
end
