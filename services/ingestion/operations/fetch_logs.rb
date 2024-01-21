# frozen_string_literal: true

require 'securerandom'

module Ingestion
  module Operations
    class FetchLogs < Ingestion::Operation
      def call(fetch_size:)
        logger.info "Fetching #{fetch_size} logs ..."
        fetch_size.times.map { |_| Random.rand(1000) }
      end
    end
  end
end
