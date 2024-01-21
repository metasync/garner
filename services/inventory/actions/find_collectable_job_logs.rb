# frozen_string_literal: true

module Inventory
  module Actions
    class FindCollectableJobLogs < Inventory::Action
      include Deps['actions.find_collectable_job_logs.contract']
      include Deps['operations.find_collectable_job_logs']

      protected

      def handle(params) =
        find_collectable_job_logs.call(limit: params[:limit])
    end
  end
end
