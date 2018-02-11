# frozen_string_literal: true

%w(object string).each do |file|
  require "core_ext/#{file}"
end

%w(identity parser validator errors json2lrtemplate exporter).each do |file|
  require "acv2lrtemplate/#{file}"
end

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
