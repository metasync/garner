# frozen_string_literal: true

# auto_register: false

module Inventory
  class Operation < Garner::Operation
    include Deps['repositories.job_logs']
  end
end
