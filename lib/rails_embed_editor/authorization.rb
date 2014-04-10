module RailsEmbedEditor
  class Authorization
    def self.authorize!(user, *args)
      case RailsEmbedEditor::Config.authorize_with
        when :cancan
          Ability.new(user).authorize!(*args)
        else
          true
      end
    end
  end
end