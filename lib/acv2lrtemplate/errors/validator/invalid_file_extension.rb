# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class InvalidFileExtension < Acv2lrtemplate::Errors::Base
        def self.default_message
          "A file with invalid extension was provided. " \
          "The accepted file extension is .acv."
        end
      end
    end
  end
end
