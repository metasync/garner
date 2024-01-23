# frozen_string_literal: true

# auto_register: false

module Simulation
  module Actors
    class Simulator < Ingestion::Actor
      include Deps['actions.start_jobs']
      include Deps['actions.run_job']
    end
  end
end
