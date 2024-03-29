# frozen_string_literal: true

module Inventory
  module Actions
    class CreateJobLogs
      class Contract < Garnet::Contract
        schema do
          required(:job_logs).array(:hash) do
            required(:name).filled(:string)
            required(:started_at).filled(:time)
            required(:ended_at).filled(:time)
            required(:job_step_logs).array(:hash) do
              required(:name).filled(:string)
              required(:started_at).filled(:time)
              required(:ended_at).filled(:time)
            end
          end
        end
      end
    end
  end
end
