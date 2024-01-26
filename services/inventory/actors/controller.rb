# frozen_string_literal: true

module Inventory
  module Actors
    class Controller < Ingestion::Actor
      include Deps['actions.create_job_logs']
      include Deps['actions.find_collectable_job_logs']
    end
  end
end
