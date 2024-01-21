# frozen_string_literal: true

module Simulation
  module Actions
    class StartJobs
      class Contract < Garnet::Contract
        schema do
          required(:jobs).array(:hash) do
            required(:name).filled(:string)
            required(:steps).filled(:integer, gt?: 0)
            required(:max_step_duration).filled(:float, gt?: 0)
            required(:error_rate).filled(:float, gt?: 0)
            required(:max_batches).filled(:integer, gt?: 0)
            required(:batch_size).filled(:integer, gt?: 0)
            required(:batch_wait).filled(:float, gt?: 0)
          end
        end
      end
    end
  end
end
