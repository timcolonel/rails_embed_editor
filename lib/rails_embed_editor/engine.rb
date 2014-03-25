module RailsEmbedEditor
  class Engine < ::Rails::Engine
    #isolate_namespace RailsEmbedEditor
    initializer 'rails_embed_editor.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper RailsEmbedEditor::ApplicationHelper
      end
    end
  end
end
