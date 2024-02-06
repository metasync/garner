# frozen_string_literal: true

module Inventory
  module Actions
    class UpdateJobLogsAsCollected < Inventory::Action
      include Deps['actions.update_job_logs_as_collected.contract']
      include Deps['operations.update_job_logs_as_collected']

      protected

      def handle(params) =
        update_job_logs_as_collected.call(
          job_ids: params[:job_logs].map(&:id)
        )
    end
  end
end
