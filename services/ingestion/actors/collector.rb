# frozen_string_literal: true

module Ingestion
  module Actors
    class Collector < Ingestion::Actor
      include Deps['actions.hello']
      include Deps['actions.fetch_logs']
    end
  end
end
