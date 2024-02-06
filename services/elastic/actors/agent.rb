# frozen_string_literal: true

module Elastic
  module Actors
    class Agent < Garner::ActorPool
      class Worker < Elastic::Actor
        include Deps['actions.intake_job_logs']
      end

      actor_class Worker
      size { settings.elastic_agent_pool_size }
    end
  end
end

# module Elastic
#   module Actors
#     class Agent < Elastic::Actor
#       include Deps['actions.intake_job_logs']
#     end
#   end
# end
