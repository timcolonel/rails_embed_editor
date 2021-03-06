module RailsEmbedEditor
  class ApplicationController < ActionController::Base

    def _authorize!(*args)
      if defined? current_user
        RailsEmbedEditor::Authorization.authorize!(current_user, *args)
      else
        true
      end
    end

    def _authorize(*args)
      begin
        _authorize! *args
        true
      rescue CanCan::AccessDenied => e
        false
      end
    end
  end
end
