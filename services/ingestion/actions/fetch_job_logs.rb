# frozen_string_literal: true

module Ingestion
  module Actions
    class FetchJobLogs < Ingestion::Action
      include Deps['messages.find_collectable_job_logs_message']

      protected

      def handle(_params)
        find_collectable_job_logs_message.deliver!(limit: settings.fetch_size)
      end
    end
  end
end
