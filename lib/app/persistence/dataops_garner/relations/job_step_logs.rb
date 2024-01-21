# frozen_string_literal: true

module Garner
  module Persistence
    module DataopsGarner
      module Relations
        class JobStepLogs < ROM::Relation[:sql]
          schema(:job_step_logs, infer: true) do
            associations do
              belongs_to :job_logs
            end
          end
        end
      end
    end
  end
end
