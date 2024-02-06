# frozen_string_literal: true

module Ingestion
  module Messages
    class SubmitJobLogsMessage < Garnet::Message
      include Elastic::Deps['actions.intake_job_logs.contract']

      from 'ingestion.actors.collector'
      to 'elastic.actors.agent'
      action :intake_job_logs
      callback :complete_job_logs
    end
  end
end
