# frozen_string_literal: true

module Ingestion
  module Actions
    class SubmitJobLogs < Ingestion::Action
      # include Deps['operations.submit_job_logs']
      include Deps['messages.submit_job_logs_message']

      protected

      # rubocop:disable Style/MultilineBlockChain
      def handle(params)
        params[:result].fmap do |job_logs|
          if job_logs.empty?
            handle_job_logs_fetch_complete
          else
            handle_job_logs_fetched(job_logs)
          end
        end.or do |error|
          handle_job_logs_fetch_failure(error)
        end
      end
      # rubocop:enable Style/MultilineBlockChain

      def handle_job_logs_fetch_complete
        logger.info "[Batch##{job.batch_name} Fetched no job logs"
        sleep job.batch_wait
        schedule_next_batch
      end

      def handle_job_logs_fetched(job_logs)
        logger.info "[Batch##{job.batch_name}] Fetched #{job_logs.size} job logs"
        submit_job_logs(job_logs)
      end

      def handle_job_logs_fetch_failure(error)
        logger.info "[Batch##{job.batch_name}] Failed to fetch job logs: #{pretty_exception(error)}"
        sleep job.batch_wait
        schedule_next_batch
      end

      def submit_job_logs(job_logs)
        slices = job_logs.each_slice(job.slice_size).to_a
        slices.each_with_index do |slice, i|
          slice_name = job.slice_name(i)
          job.fetched[slice_name] = slice
          submit_job_logs_message.deliver!(slice: slice_name, job_logs: slice)
        end
      end
    end
  end
end
