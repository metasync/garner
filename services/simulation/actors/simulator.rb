# frozen_string_literal: true

module Simulation
  module Actors
    class Simulator < Garner::ActorPool
      class Worker < Simulation::Actor
        include Deps['actions.start_jobs']
        include Deps['actions.run_job']
      end

      actor_class Worker
      size { settings.simulator_pool_size }
    end
  end
end

# module Simulation
#   module Actors
#     class Simulator < Simulation::Actor
#       include Deps['actions.start_jobs']
#       include Deps['actions.run_job']
#     end
#   end
# end
