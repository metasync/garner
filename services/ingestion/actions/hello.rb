# frozen_string_literal: true

module Ingestion
  module Actions
    class Hello < Ingestion::Action
      include Deps['actions.hello.contract']
      include Deps['operations.say_hello']

      protected

      def handle(params)
        say_hello.call(params[:message])
      end
    end
  end
end
