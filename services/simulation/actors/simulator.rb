# frozen_string_literal: true

module Simulation
  module Actors
    class Simulator < Garner::ActorPool
      def actor_class = Worker
      def size = settings.simulator_pool_size

      class Worker < Ingestion::Actor
        include Deps['actions.start_jobs']
        include Deps['actions.run_job']
      end
    end
  end
end
