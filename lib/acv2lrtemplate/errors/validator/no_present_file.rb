# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Validator
      class NoPresentFile < Acv2lrtemplate::Errors::Base
        def self.default_message
          "No file was found at the provided path. " \
          "Please check the path."
        end
      end
    end
  end
end
