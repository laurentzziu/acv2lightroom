# frozen_string_literal: true

require 'securerandom'
require 'json'

COPYRIGHT = "This file was generated automatically by the ACV2LRTemplate Ruby gem. (https://github.com/laurentzziu/acv2lrtemplate) " \
            "Copyright at Florinel Gorgan. https://floringorgan.com"

module Acv2lrtemplate
  class Exporter
    TITLES = %i(ToneCurvePV2012 ToneCurvePV2012Red
                ToneCurvePV2012Green ToneCurvePV2012Blue).freeze

    attr_reader :curves, :file_name, :name, :exported_file

    # TODO: add option to export to memory, not to a file
    def initialize(curves, file_name, name = nil)
      raise Acv2lrtemplate::Errors::Exporter::CurvesDataInvalid unless !curves.blank? && curves.kind_of?(Array)
      @curves = curves
      raise Acv2lrtemplate::Errors::Exporter::NoFileProvided if file_name.blank?
      @file_name = file_name
      @name = name || sanitize_filename.titleize
      @exported_file = nil
    end

    def export!
      structure = generate_structure.to_json
      string = Acv2lrtemplate::JSON2lrtemplate.new(structure).convert!

      File.open(new_file_name, 'w') do |file|
        file.puts("--#{COPYRIGHT}")
        file.puts(string)
      end

      @exported_file = new_file_name

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
        .tr('\/:*?"<>|!@#$%^&±~[]{}=+ ', '_')
        .gsub(/_+/, '_')
        .sub(/\A_/, '').sub(/_\z/, '')
    end

    def file_path
      File.dirname(@file_name)
    end
  end
end
