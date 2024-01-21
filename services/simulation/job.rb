# frozen_string_literal: true

# auto_register: false

module Simulation
  class Job
    extend Dry::Initializer

    option :name
    option :steps
    option :max_step_duration
    option :error_rate
    option :batch_size
    option :batch_wait
    option :max_batches, default: proc { Float::INFINITY }
    option :batches, default: proc { 0 }

    def run
      render_job_log.tap do |job_log|
        render_step_logs(job_log)
        @batches += 1
      end
    end

    def max_batches_reached? = @batches >= max_batches

    protected

    def render_job_log
      job_log = { name: @name, job_step_logs: [] }
      job_log[:started_at] = Time.now
      render_step_logs(job_log)
      job_log[:ended_at] = Time.now
      job_log
    end

    def render_step_logs(job_log)
      @steps.times do |i|
        job_log[:job_step_logs] << render_step_log(i)
      end
    end

    def render_step_log(step)
      step_log = { name: "step #{step}" }
      step_log[:started_at] = Time.now
      raise StandardError, "Random error hit for #{@name}" if @error_rate > Random.rand

      sleep Random.rand(max_step_duration)
      step_log
    rescue StandardError => e
      step_log[:error] = e
      step_log
    ensure
      step_log[:ended_at] = Time.now
    end
  end
end
