# frozen_string_literal: true

module Inventory
  module Operations
    class CreateJobLogs < Inventory::Operation
      def call(logs)
        Sync do
          job_logs.transaction do
            logs.each do |job_log|
              job_logs.create(new_job_log(job_log))
            end
          end
        end
      end

      protected

      def new_job_log(job_log)
        job_log.merge!(
          collected_at: false,
          created_at: Time.now.utc
        )
        job_log[:job_step_logs].each do |job_step_log|
          job_step_log.merge!(created_at: Time.now.utc)
        end
        job_log
      end
    end
  end
end
