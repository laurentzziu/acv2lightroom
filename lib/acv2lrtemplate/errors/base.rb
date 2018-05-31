# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    class Base < StandardError
      attr_reader :message

      def self.default_message
        "There was an error."
      end

      def initialize(message = nil)
        @message = message || self.class.default_message
        super(@message)
      end
    end
  end
end
