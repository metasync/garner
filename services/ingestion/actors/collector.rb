# frozen_string_literal: true

# module Ingestion
#   module Actors
#     class Collector < Garner::ActorPool
#       class Worker < Ingestion::Actor
#         include Deps['actions.start_job']
#         include Deps['actions.on_job_logs_fetched']
#       end

#       actor_class Worker
#       size { settings.collector_pool_size }
#     end
#   end
# end

module Ingestion
  module Actors
    class Collector < Ingestion::Actor
      include Deps['actions.start_job']
      include Deps['actions.submit_job_logs']
      include Deps['actions.complete_job_logs']
      include Deps['actions.complete_slice']
    end
  end
end
