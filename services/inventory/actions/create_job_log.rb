# frozen_string_literal: true

module Inventory
  module Actions
    class CreateJobLog < Inventory::Action
      include Deps['actions.create_job_log.contract']
      include Deps['operations.create_job_log']

      protected

      def handle(params) =
        create_job_log.call(job_log: params[:job_log])
    end
  end
end
