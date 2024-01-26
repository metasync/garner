# frozen_string_literal: true

module Ingestion
  module Actions
    class FetchJobLogs < Ingestion::Action
      include Deps['messages.find_collectable_job_logs_message']

      protected

      def handle(_params)
        job_logs = find_collectable_job_logs_message.deliver!(fetch_size: settings.fetch_size)
        logger.info "Fetched job logs: #{job_logs.inspect}"
      end
    end
  end
end
