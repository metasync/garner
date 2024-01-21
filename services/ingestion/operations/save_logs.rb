# frozen_string_literal: true

module Ingestion
  module Operations
    class SaveLogs < Ingestion::Operation
      include Deps['messages.check_in_message']
      # include Store::Deps[store: 'actors.worker']

      def call(logs)
        logger.info "Saving #{logs.size} logs ..."
        check_in_message.deliver!(items: logs)
      end
    end
  end
end
