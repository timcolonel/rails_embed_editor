module RailsEmbedEditor
  module ApplicationHelper
    def rails_embed_editor(filename, options ={})
      manager = RailsEmbedEditor::FileManager.from_options(filename, options)
      text = manager.read_text
      first_line = manager.first_line
      content_tag('div', text, :class => 'rails_embed_code_editor', 'data-first-line' => first_line)
    end
  end
end
