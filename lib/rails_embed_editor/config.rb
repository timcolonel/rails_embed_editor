require 'active_support/core_ext/module/attribute_accessors'

module RailsEmbedEditor
  module Config
    class << self
      attr_accessor :authorize_with

      def reset
        self.authorize_with = nil
      end
    end
  end
end