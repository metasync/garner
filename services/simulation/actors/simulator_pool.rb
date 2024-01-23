# frozen_string_literal: true

module Simulation
  module Actors
    class SimulatorPool < Garner::ActorPool
      def actor_class = Simulator
      def size = settings.simulator_pool_size
    end
  end
end
