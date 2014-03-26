module RailsEmbedEditor
  module ApplicationHelper
    def rails_embed_editor(filename, options ={})
      options[:editormode] ||= RailsEmbedEditor::EditorMode::READ_ONLY
      manager = RailsEmbedEditor::FileManager.from_options(filename, options)
      text = manager.read_text
      first_line = manager.first_line
      last_line = manager.last_line
      content_tag('div', text, :class => 'rails_embed_code_editor',
                  'data-first-line' => first_line, 'data-last-line' => last_line, 'data-filename' => filename,
                  'data-editormode' => options[:editormode])
    end
  end
end
