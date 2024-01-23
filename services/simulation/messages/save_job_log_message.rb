# frozen_string_literal: true

module Simulation
  module Messages
    class SaveJobLogMessage < Garnet::Message
      include Inventory::Deps['actions.create_job_log.contract']

      from 'simulation.actors.simulator_pool'
      to 'inventory.actors.controller'
      action 'create_job_log'
    end
  end
end
