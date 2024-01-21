# frozen_string_literal: true

module Garner
  module Persistence
    module DataopsGarner
      module Relations
        class JobLogs < ROM::Relation[:sql]
          schema(:job_logs, infer: true)
        end
      end
    end
  end
end
