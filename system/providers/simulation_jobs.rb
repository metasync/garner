# frozen_string_literal: true

module Simulation
  JOBS = [
    Simulation::Job.new(
      name: 'test-job-1',
      steps: 2,
      max_step_duration: 0.1,
      error_rate: 0.05,
      max_batches: 50,
      batch_size: 10,
      batch_wait: 0.5
    ),
    Simulation::Job.new(
      name: 'test-job-2',
      steps: 4,
      max_step_duration: 0.05,
      error_rate: 0.01,
      max_batches: 50,
      batch_size: 10,
      batch_wait: 0.5
    ),
    Simulation::Job.new(
      name: 'test-job-3',
      steps: 6,
      max_step_duration: 0.01,
      error_rate: 0.01,
      max_batches: 50,
      batch_size: 10,
      batch_wait: 0.5
    )
  ].freeze
  Service.register_provider :jobs do
    start { register(:jobs, JOBS) }
  end
end
