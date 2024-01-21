# frozen_string_literal: true

module Ingestion
  module Messages
    class CheckInMessage < Garnet::Message
      include Store::Deps['actions.check_in.contract']

      from 'ingestion.actors.collector'
      to 'store.actors.worker'
      action 'check_in'
    end
  end
end
