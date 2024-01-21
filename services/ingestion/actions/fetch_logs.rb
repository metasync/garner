# frozen_string_literal: true

module Ingestion
  module Actions
    class FetchLogs < Ingestion::Action
      include Deps['operations.fetch_logs']
      include Deps['operations.save_logs']

      protected

      def handle(_params)
        logs = fetch_logs.call(fetch_size: settings.fetch_size)
        logger.info "Fetched logs: #{logs.inspect}"
        save_logs.call(logs)
      end
    end
  end
end
