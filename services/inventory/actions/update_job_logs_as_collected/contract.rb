# frozen_string_literal: true

module Inventory
  module Actions
    class UpdateJobLogsAsCollected
      class Contract < Garnet::Contract
        schema do
          required(:slice).filled(:string)
          required(:job_logs).filled(:array)
        end
      end
    end
  end
end
