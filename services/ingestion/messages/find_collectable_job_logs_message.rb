# frozen_string_literal: true

module Ingestion
  module Messages
    class FindCollectableJobLogsMessage < Garnet::Message
      include Inventory::Deps['actions.find_collectable_job_logs.contract']

      from 'ingestion.actors.collector'
      to 'inventory.actors.controller'
      action 'find_collectable_job_logs'
    end
  end
end
