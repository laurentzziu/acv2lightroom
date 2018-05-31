# frozen_string_literal: true

require 'thor'
require 'paint'

module Acv2lrtemplate
  class CLI < Thor
    method_option :name, type: :string

    desc "convert [file_path]", "Convert .acv file to .lrtemplate"
    def convert(file_path)
      begin
        file_name = Acv2lrtemplate.convert!(file_path, options[:name])
        print_success(file_name)
      rescue => e
        print_error(e.message)
      end
    rescue 
    end

    def self.exit_on_failure?
      true
    end

    no_commands do
      def print_success(file_name)
        puts "#{Paint['Success!', :green]} .lrtemplate file created."
        puts "File available in #{file_name}."
      end

      def print_error(message)
        puts "#{Paint['Error:', :red]} #{message}"
      end
    end
  end
end