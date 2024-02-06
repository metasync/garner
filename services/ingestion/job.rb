# frozen_string_literal: true

# auto_register: false

require 'concurrent/map'

module Ingestion
  class Job
    extend Dry::Initializer

    DEFAULT_BATCH_WAIT = 15 # seconds

    option :name
    option :batch_size
    option :slice_size
    option :batch_wait, default: proc { DEFAULT_BATCH_WAIT }
    option :max_batches, default: proc { Float::INFINITY }
    option :batches, default: proc { 0 }
    option :fetched, default: proc { Concurrent::Map.new }
    option :processed, default: proc { Concurrent::Map.new }
    option :submitted, default: proc { Concurrent::Map.new }
    option :failed, default: proc { Concurrent::Map.new }

    def max_batches_reached? = @batches > max_batches
    def batch_completed? = fetched.size == processed.size

    def batch_name = "#{name}:b-#{batches}"
    def slice_name(slice) = "#{name}:b-#{batches}:s-#{slice}"

    def next_batch = @batches += 1
  end
end
