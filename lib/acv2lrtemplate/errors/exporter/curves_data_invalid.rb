# frozen_string_literal: true

module Acv2lrtemplate
  module Errors
    module Exporter
      class CurvesDataInvalid < Acv2lrtemplate::Errors::Base
        def self.default_message
          "The provided curves data is invalid. " \
          "Make sure to run the Exporter after the Parser."
        end
      end
    end
  end
end
