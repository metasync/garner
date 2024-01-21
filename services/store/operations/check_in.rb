# frozen_string_literal: true

module Store
  module Operations
    class CheckIn < Store::Operation
      include Deps['cache']

      def call(items)
        items.each do |item|
          cache.push item
          logger.info "checked in item: #{item.inspect}"
        end
      end
    end
  end
end
