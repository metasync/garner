# frozen_string_literal: true

module Ingestion
  module Operations
    class SayHello < Ingestion::Operation
      def call(message)
        logger.info "hello: #{message}"
      end
    end
  end
end
