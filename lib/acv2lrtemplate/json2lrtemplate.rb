# frozen_string_literal: true

module Acv2lrtemplate
  class JSON2lrtemplate
    attr_reader :json_string

    def initialize(json_string)
      @json_string = json_string
    end

    # Transform "keys" to keys
    # Transform [] to {} - works for values on the same line?
    # Transform : to =
    # Remove leading and ending {}
    # , before closing }

    def convert!
      @json_string.gsub(/"(\w+)"(?=:)/) { |_| $1.camelize(false) }
                  .gsub(/(\[[.\S\s^"]*?\])/) { |_| $1.tr('[]', '{}') }
                  .gsub(':', ' = ')
                  .sub(/\A{/, '').sub(/}\Z/, '')
                  .gsub(/(?<=.)(}){1}(?=.)?/) { |_| ",#{$1}" }
    end
  end
end
