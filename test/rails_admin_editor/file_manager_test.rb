require 'test_helper'
class FileManagerTest < ActiveSupport::TestCase

  def filename
    'test/rails_admin_editor/dumbfile.erb'
  end

  test 'Init from options with around' do
    line = 5
    radius = 3
    manager = RailsEmbedEditor::FileManager.from_options(filename, {:line => line, :radius => radius})
    assert manager.first_line = line-radius
    assert manager.last_line = line+radius
  end
  test 'Init from options with range' do
    first_line = 2
    last_line = 5
    manager = RailsEmbedEditor::FileManager.from_options(filename, {:first_line => first_line, :last_line => last_line})
    assert manager.first_line = first_line
    assert manager.last_line = last_line
  end

  test 'Read right lines' do
    first_line = 2
    last_line = 5
    manager = RailsEmbedEditor::FileManager.from_options(filename, {:first_line => first_line, :last_line => last_line})
    assert manager.read_lines.size == last_line - first_line + 1
  end
end