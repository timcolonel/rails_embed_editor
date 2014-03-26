require 'test_helper'

class EditorControllerTest < ActionController::TestCase
  tests RailsEmbedEditor::EditorController

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


  test 'should not edit' do
    get :edit
    assert (not JSON.parse(@response.body)['success']), "Should return not success but returned #{@response.body}"
  end

  test 'should edit file' do
    first_line = 2
    last_line = 5
    text= 'Replace with some othe ansowmn content'
    get :edit, :filename => filename, :first_line => first_line, :last_line => last_line, :content => text
    assert(JSON.parse(@response.body)['success'], "Should return success but returned #{@response.body}")
  end


end