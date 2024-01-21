# frozen_string_literal: true

# auto_register: false

module Garner
  class Operation
    include Deps[:settings]
    include Deps[:logger]
    include Deps[:inflector]
  end
end
