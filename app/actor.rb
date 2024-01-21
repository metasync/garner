# frozen_string_literal: true

# auto_register: false

module Garner
  class Actor < Garnet::Actor
    include Deps[:settings]
    include Deps[:logger]
    include Deps[:inflector]
  end
end
