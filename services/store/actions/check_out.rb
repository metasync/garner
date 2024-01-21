# frozen_string_literal: true

module Store
  module Actions
    class CheckOut < Ingestion::Action
      include Deps['operations.check_out']

      protected

      def handle(_params) = check_out.call
    end
  end
end
