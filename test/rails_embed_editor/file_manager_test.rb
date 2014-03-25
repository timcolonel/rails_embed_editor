require 'test_helper'
class FileManagerTest < ActiveSupport::TestCase

  def destination
    File.expand_path('../../tmp/edit_test', __FILE__)
  end

  def filename
    "#{destination}/dumbfile.erb"
  end

  def setup
    FileUtils.mkdir_p(File.dirname(filename))
    FileUtils.cp 'test/rails_embed_editor/dumbfile.erb', filename
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

  test 'Save text' do
    first_line = 2
    last_line = 5
    manager = RailsEmbedEditor::FileManager.from_options(filename, {:first_line => first_line, :last_line => last_line})
    text = "REPLACED 3 LINES\nBY 2"
    line_count = File.open(filename) { |f| f.count }
    puts line_count
    line_count_should_be = line_count - (last_line - first_line + 1-text.split(/\r?\n/).size)
    manager.save_text text
    line_count = File.open(filename) { |f| f.count }
    assert line_count_should_be == line_count, "Wrong line count: \n\t should be:\t #{line_count_should_be} \n\t but is:\t#{line_count}"
  end
end