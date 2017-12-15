# frozen_string_literal: true
require 'securerandom'
require 'json'

COPYRIGHT = "This file was generated automatically by the Acv2lrtemplate Ruby gem."

# parsed = Acv2lrtemplate::Parser.new(File.join(Acv2lrtemplate.spec, 'support', 'files', 's_line.acv'))
# Acv2lrtemplate::Exporter.new(parsed.curves, parsed.acv_file, "S Line").export!

module Acv2lrtemplate
  class Exporter
    TITLES = %i(ToneCurvePV2012 ToneCurvePV2012Blue
                ToneCurvePV2012Green ToneCurvePV2012Red).freeze
    attr_reader :curves, :file_name, :name

    def initialize(curves, file_name, name = nil)
      @curves = curves
      @file_name = file_name
      @name = name || sanitize_filename.titleize
      @exported_file = nil
    end

    def export!
      string = Acv2lrtemplate::JSON2lrtemplate.new(generate_structure.to_json).convert!
      File.open(new_file_name, 'w') do |file|
        file.puts("--#{COPYRIGHT}")
        file.puts(string)
      end
      new_file_name
    end

    private

    def generate_structure
      {
        s: {
          id: SecureRandom.uuid.upcase,
          internal_name: @name,
          title: @name,
          type: 'Develop',
          value: {
            uuid: SecureRandom.uuid.upcase,
            settings: generate_settings
          },
          version: 0
        }
      }
    end

    def export_curves
      hash = {}
      @curves.map.with_index do |channel, index|
        hash[TITLES[index]] = channel.flatten
      end
      hash
    end

    def generate_settings
      export_curves.merge(ToneCurveName2012: @name)
    end

    def new_file_name
      File.join(file_path, sanitize_filename) + '.lrtemplate'
    end

    def sanitize_filename
      File.basename(@name || @file_name, '.*').downcase
        .tr('\/:*?"<>|!@#$%^&±~[]{}=+', '_')
        .gsub(/_+/, '_')
        .sub(/\A_/, '').sub(/_\z/, '')
    end

    def file_path
      File.dirname(@file_name)
    end
  end
end
