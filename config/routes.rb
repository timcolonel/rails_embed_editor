Rails.application.routes.draw do
  post '/rails_embed_editor/edit' => 'rails_embed_editor/editor#edit', :as => :rails_embed_editor_edit
end