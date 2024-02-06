# frozen_string_literal: true

module Inventory
  module Operations
    class UpdateJobLogsAsCollected < Inventory::Operation
      def call(job_ids:)
        Sync do
          job_logs.update_as_collected(job_ids)
        end
      end
    end
  end
end
