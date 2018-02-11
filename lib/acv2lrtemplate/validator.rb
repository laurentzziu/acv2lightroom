# frozen_string_literal: true

module Acv2lrtemplate
  class Validator
    attr_reader :filename

    def initialize(filename)
      @filename = filename
    end

    def valid?
      validate
    end

    def invalid?
      !valid?
    end

    def validate
      validate_presence
      validate_extension
    end

    private

    ACCEPTED_FORMATS = %w[.acv .ACV].freeze

    def validate_extension
      unless ACCEPTED_FORMATS.include?(File.extname(@filename))
        raise Acv2lrtemplate::Errors::Validator::InvalidFileExtension
      end
    end

    def validate_presence
      unless File.exist?(@filename)
        raise Acv2lrtemplate::Errors::Validator::NoPresentFile
      end
    end
  end
end
