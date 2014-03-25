require 'ace/rails'
require 'rails_embed_editor/engine'
require 'rails_embed_editor/config'
require 'rails_embed_editor/file_manager'

module RailsEmbedEditor
  def self.config(&block)
    if block_given?
      block.call(RailsEmbedEditor::Config)
    else
      RailsEmbedEditor::Config
    end
  end
end
