# frozen_string_literal: true

module Store
  module Actions
    class CheckIn
      class Contract < Garnet::Contract
        schema do
          required(:items).array(:integer)
        end
      end
    end
  end
end
