# frozen_string_literal: true

module Inventory
  module Actions
    class FindCollectableJobLogs
      class Contract < Garnet::Contract
        schema do
          required(:limit).array(:integer)
        end
      end
    end
  end
end
