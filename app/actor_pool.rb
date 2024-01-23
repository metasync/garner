# frozen_string_literal: true

# auto_register: false

module Garner
  class ActorPool < Garnet::ActorPool
    include Deps[:settings]
    include Deps[:logger]
    include Deps[:inflector]
  end
end
