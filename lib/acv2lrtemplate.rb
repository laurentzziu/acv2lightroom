# frozen_string_literal: true

require "core_ext/string"

require "acv2lrtemplate/identity"
require "acv2lrtemplate/parser"
require "acv2lrtemplate/validator"
require "acv2lrtemplate/errors"
require "acv2lrtemplate/json2lrtemplate"
require "acv2lrtemplate/exporter"

module Acv2lrtemplate
  def self.convert!(filename, export_name = nil)
    @parsed = Acv2lrtemplate::Parser.new(filename)
    Acv2lrtemplate::Exporter.new(@parsed.curves, @parsed.acv_file, export_name).export!
  end

  def self.root
    File.dirname __dir__
  end

  def self.lib
    File.join(root, 'lib')
  end

  def self.spec
    File.join(root, 'spec')
  end
end
