# frozen_string_literal: true

module Elastic
  module Actions
    class IntakeJobLogs
      class Contract < Garnet::Contract
        schema do
          required(:slice).filled(:string)
          required(:job_logs).filled(:array)
        end
      end
    end
  end
end
