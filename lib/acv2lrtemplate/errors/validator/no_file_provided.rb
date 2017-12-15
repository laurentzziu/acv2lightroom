# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class NoFileProvided < StandardError
        DEFAULT_MESSAGE = "No file was provided. " \
                          "Please provide a file.".freeze

        def initialize(message = nil)
          super(message || DEFAULT_MESSAGE)
        end
      end
    end
  end
end
