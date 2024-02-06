# frozen_string_literal: true

require 'bundler/setup'
require 'async'
require 'garnet'
require_relative 'app'

Garnet.boot

puts "App name: #{Garnet.app.app_name}"
puts "App container keys: #{Garnet.app.keys}"
puts "App services: #{Garnet.services.keys.to_a}"
puts

puts "Simulation container keys: #{Simulation::Service.keys}"
puts "Ingestion container keys: #{Ingestion::Service.keys}"
puts "Inventory container keys: #{Inventory::Service.keys}"
puts "Elastic container keys: #{Elastic::Service.keys}"
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

Simulation::Service['actors.simulator'].request(:start_jobs)
Ingestion::Service['actors.collector'].request(:start_job)

sleep 15

puts

Garnet.shutdown
