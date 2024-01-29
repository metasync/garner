# frozen_string_literal: true

module Inventory
  module Repositories
    class JobLogs < Garner::Repository[:job_logs]
      include Deps['repositories.job_step_logs']

      def create(job_log)
        base_query.command(:create).call(job_log)
      end

      def find_collectable(limit:) =
        job_logs
          .where(collected: false)
          .exclude(ended_at: nil)
          .order { started_at.asc }
          .limit(limit)
          .to_a

      def find_by_ids(job_ids) =
        base_query.where(id: job_ids).to_a

      protected

      def base_query = job_logs.combine(:job_step_logs)
    end
  end
end
