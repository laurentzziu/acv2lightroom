# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class NoFileProvided < Acv2lrtemplate::Errors::Base
        def self.default_message
          "No file was provided. " \
          "Please provide a file."
        end
      end
    end
  end
end
