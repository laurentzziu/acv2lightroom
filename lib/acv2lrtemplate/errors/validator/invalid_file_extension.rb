# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class InvalidFileExtension < StandardError
        DEFAULT_MESSAGE = "A file with invalid extension was provided. " \
                          "The accepted file extension is .acv.".freeze

        def initialize(message = nil)
          super(message || DEFAULT_MESSAGE)
        end
      end
    end
  end
end
