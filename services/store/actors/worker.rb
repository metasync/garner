# frozen_string_literal: true

module Store
  module Actors
    class Worker < Store::Actor
      include Deps['actions.check_in']
      include Deps['actions.check_out']
    end
  end
end
