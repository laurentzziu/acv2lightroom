# frozen_string_literal: true

require 'curver'

module Acv2lrtemplate
  class Parser
    attr_reader :acv_file, :curver
    attr_accessor :curves

    def initialize(filename)
      fail Acv2lrtemplate::Errors::Validator::NoFileProvided if filename.nil?
      @acv_file = filename
      validate
      parse
    end

    def parse
      @curver = Curver.new(@acv_file)
      @curves = parse_channels
    end

    private

    def validate
      Acv2lrtemplate::Validator.new(@acv_file).validate
    end

    def parse_channels
      # channels: RGB, R(ed), G(reen), B(lue)
      @curves = @curver.curves.map do |channel|
        channel.points.map do |point|
          point_convertor(point)
        end
      end
    end

    # The 'curver' gem parses the Adobe Photoshop Curves file as
    # points with x and y coordinates between 0.0 and 1.0
    # Adobe Lightroom uses points with coordinates between
    # 0 and 255, so a conversion is needed
    def point_convertor(point)
      point.map do |coordonate|
        (coordonate * 255).to_i
      end
    end
  end
end
