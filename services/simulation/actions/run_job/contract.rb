# frozen_string_literal: true

module Simulation
  module Actions
    class RunJob
      class Contract < Garnet::Contract
        schema do
          required(:job)
        end
      end
    end
  end
end
