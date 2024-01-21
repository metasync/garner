# frozen_string_literal: true

module Store
  module Actions
    class CheckIn < Ingestion::Action
      include Deps['actions.check_in.contract']
      include Deps['operations.check_in']

      protected

      def handle(params) = check_in.call(params[:items])
    end
  end
end
