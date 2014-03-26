require 'test_helper'

class EditorControllerTest < ActionController::TestCase
  tests RailsEmbedEditor::EditorController

  test 'should not edit' do
    get :edit
    assert (not JSON.parse(@response.body)['success']), "Should return not success but returned #{@response.body}"
  end

  test 'should edit file' do

    #get :edit
    #assert(JSON.parse @response.body['success'], "Should return success but returned #{@response.body}")
  end


end