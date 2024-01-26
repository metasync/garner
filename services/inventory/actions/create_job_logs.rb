# frozen_string_literal: true

module Inventory
  module Actions
    class CreateJobLogs < Inventory::Action
      include Deps['actions.create_job_logs.contract']
      include Deps['operations.create_job_logs']

      protected

      def handle(params) =
        create_job_logs.call(params[:job_logs])
    end
  end
end
