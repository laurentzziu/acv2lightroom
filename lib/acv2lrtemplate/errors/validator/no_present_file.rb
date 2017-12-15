# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class NoPresentFile < StandardError
        DEFAULT_MESSAGE = "No file was found at the provided path. " \
                          "Please check the path.".freeze

        def initialize(message = nil)
          super(message || DEFAULT_MESSAGE)
        end
      end
    end
  end
end
