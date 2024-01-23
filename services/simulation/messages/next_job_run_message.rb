# frozen_string_literal: true

module Simulation
  module Messages
    class NextJobRunMessage < Garnet::Message
      include Deps['actions.run_job.contract']

      from 'simulation.actors.simulator_pool'
      to 'simulation.actors.simulator_pool'
      action 'run_job'
    end
  end
end
