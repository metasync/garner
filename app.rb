# frozen_string_literal: true

require_relative 'services/ingestion'
require_relative 'services/store'
require_relative 'services/inventory'
require_relative 'services/simulation'

module Garner
  class App < Garnet::Application
    VERSION = '0.1.0'
  end
end
