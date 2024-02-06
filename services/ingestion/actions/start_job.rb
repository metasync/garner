# frozen_string_literal: true

module Ingestion
  module Actions
    class StartJob < Ingestion::Action
      protected

      def handle(_params) = schedule_next_batch
    end
  end
end
