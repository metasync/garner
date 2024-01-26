# frozen_string_literal: true

module Simulation
  module Messages
    class SaveJobLogsMessage < Garnet::Message
      include Inventory::Deps['actions.create_job_logs.contract']

      from 'simulation.actors.simulator'
      to 'inventory.actors.controller'
      action 'create_job_logs'
    end
  end
end
