# frozen_string_literal: true

module Ingestion
  module Actions
    class Hello
      class Contract < Garnet::Contract
        schema do
          required(:message).value(:string)
        end
      end
    end
  end
end
