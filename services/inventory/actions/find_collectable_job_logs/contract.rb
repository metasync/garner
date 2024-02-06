# frozen_string_literal: true

module Inventory
  module Actions
    class FindCollectableJobLogs
      class Contract < Garnet::Contract
        schema do
          required(:limit).filled(:integer, gt?: 0)
        end
      end
    end
  end
end
