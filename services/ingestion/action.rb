# frozen_string_literal: true

# auto_register: false

module Ingestion
  class Action < Garner::Action
    include Deps['job']
    include Deps['messages.fetch_job_logs_message']

    protected

    def schedule_next_batch
      job.next_batch
      if job.max_batches_reached?
        logger.info "[Job##{job.name}] Ingestion job is completed"
      else
        fetch_job_logs_message.deliver!(limit: job.batch_size)
        logger.info "[Batch##{job.batch_name}] Scheduled next batch for ingestion job"
      end
    end
  end
end
