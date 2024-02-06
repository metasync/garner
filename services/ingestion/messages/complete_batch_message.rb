# frozen_string_literal: true

module Ingestion
  module Messages
    class CompleteBatchMessage < Garnet::Message
      from 'ingestion.actors.collector'
      to 'ingestion.actors.collector'
      action :complete_batch
    end
  end
end
