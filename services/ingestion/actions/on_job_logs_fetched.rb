# frozen_string_literal: true

module Ingestion
  module Actions
    class OnJobLogsFetched < Ingestion::Action
      include Deps['messages.find_collectable_job_logs_message']

      protected

      def handle(params)
        job_logs = params[:data].value_or([])
        logger.info "Fetched #{job_logs.size} job logs:\n$#{job_logs.inspect}"
      end
    end
  end
end
