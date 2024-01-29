# frozen_string_literal: true

module Ingestion
  module Actors
    class Collector < Garner::ActorPool
      class Worker < Ingestion::Actor
        include Deps['actions.hello']
        include Deps['actions.fetch_job_logs']
        include Deps['actions.on_job_logs_fetched']
      end

      actor_class Worker
      size { settings.collector_pool_size }
    end
  end
end

# module Ingestion
#   module Actors
#     class Collector < Ingestion::Actor
#       include Deps['actions.hello']
#       include Deps['actions.fetch_job_logs']
#       include Deps['actions.on_job_logs_fetched']
#     end
#   end
# end
