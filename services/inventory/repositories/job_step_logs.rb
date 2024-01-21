# frozen_string_literal: true

module Inventory
  module Repositories
    class JobStepLogs < Garner::Repository[:job_step_logs]
      commands :create
    end
  end
end
