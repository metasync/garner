# frozen_string_literal: true

module Ingestion
  module Actions
    class CompleteJobLogs < Ingestion::Action
      include Deps['messages.complete_job_logs_message']

      protected

      # rubocop:disable Style/MultilineBlockChain, Metrics/AbcSize
      def handle(params)
        slice = params[:request][:data][:slice]
        job_logs = params[:request][:data][:job_logs]
        params[:result].fmap do |_|
          logger.info "[Slice##{slice}] Submitted #{job_logs.size} job logs"
          succeed_job_logs_submission(slice, job_logs)
        end.or do |e|
          logger.info "[Slice##{slice}] Failed to submit #{job_logs.size} job logs: #{pretty_exception(e)}"
          fail_job_logs_submission(slice, job_logs)
        end
      end
      # rubocop:enable Style/MultilineBlockChain, Metrics/AbcSize

      def succeed_job_logs_submission(slice, job_logs)
        job_logs.each do |job_log|
          job.submitted[job_log.id] = job_log
        end
        complete_job_logs_message.deliver!(slice:, job_logs:)
      end

      def fail_job_logs_submission(slice, job_logs)
        job.fetched[slice].each do |job_log|
          job.failed[job_log.id] = job_log
        end
        job.processed[slice] = job_logs
        schedule_next_batch if job.batch_completed?
      end
    end
  end
end
