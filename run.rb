# frozen_string_literal: true

require 'bundler/setup'
require 'garnet'
require_relative 'app'

Garnet.boot

puts "App name: #{Garnet.app.app_name}"
puts "App container keys: #{Garnet.app.keys}"
puts "App services: #{Garnet.services.keys.to_a}"
puts

puts "Ingestion container keys: #{Ingestion::Service.keys}"
puts "Store container keys: #{Store::Service.keys}"
puts "Simulation container keys: #{Simulation::Service.keys}"
puts "Inventory container keys: #{Inventory::Service.keys}"
puts

# puts Garnet.app.env
# puts Garnet.actor('ingestion.actors.collector').class.name
# puts

# Ingestion::Service['actors.collector'].request(
#   :hello,
#   message: 'test message'
# )

# puts Garnet.app["persistence.db"].inspect
# puts Garnet.app["persistence.#{ENV['DB_NAME']}.db"].inspect
# puts Garnet.app.providers[:persistence].source.config.name.inspect
# puts Garnet.app.providers.providers.keys.inspect
# puts Garnet.services.inspect
# puts Garnet.services["simulation"].providers.providers.keys.inspect

Simulation::Service['actors.simulator'].request(
  :start_jobs,
  jobs: [
    {
      name: 'test-job-1',
      steps: 2,
      max_step_duration: 0.1,
      error_rate: 0.05,
      max_batches: 5,
      batch_size: 10,
      batch_wait: 0.5
    },
    {
      name: 'test-job-2',
      steps: 4,
      max_step_duration: 0.05,
      error_rate: 0.01,
      max_batches: 5,
      batch_size: 10,
      batch_wait: 0.5
    },
    {
      name: 'test-job-3',
      steps: 6,
      max_step_duration: 0.01,
      error_rate: 0.01,
      max_batches: 5,
      batch_size: 10,
      batch_wait: 0.5
    }
  ]
)

sleep 10
puts

Garnet.shutdown
