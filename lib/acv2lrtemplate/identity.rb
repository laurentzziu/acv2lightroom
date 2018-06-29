# frozen_string_literal: true

module Acv2lrtemplate
  # Gem identity information.
  module Identity
    def self.name
      "acv2lrtemplate"
    end

    def self.label
      "ACV2LRTemplate"
    end

    def self.version
      "0.2.1"
    end

    def self.version_label
      "#{label} #{version}"
    end
  end
end
