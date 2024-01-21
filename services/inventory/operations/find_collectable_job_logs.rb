# frozen_string_literal: true

module Inventory
  module Operations
    class FindCollectableJobLogs < Inventory::Operation
      def call(limit:)
        job_logs.find_collectable(limit:)
      end
    end
  end
end
