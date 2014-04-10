require 'active_support/core_ext/module/attribute_accessors'

module RailsEmbedEditor
  module Config
    class << self
      attr_accessor :authorize_with

      def reset
        self.authorize_with = nil
      end

      def authorize_with(param = nil)
        if param.nil?
          @authorize_with
        else
          @authorize_with = param
        end

      end
    end
  end
end