# frozen_string_literal: true

module Store
  module Operations
    class CheckOut < Store::Operation
      include Deps['cache']

      def call
        cache.pop.tap do |item|
          logger.info "checked out item: #{item.inspect}"
        end
      end
    end
  end
end
