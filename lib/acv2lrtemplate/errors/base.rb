# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    class Base < StandardError
      def self.default_message
        "There was an error."
      end

      def initialize(message = nil)
        super(message || self.class.default_message)
      end
    end
  end
end
