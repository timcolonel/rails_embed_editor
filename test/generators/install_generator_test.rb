require 'test_helper'
require 'rails/generators'
require 'generators/rails_embed_editor/install_generator'


class InstallGeneratorTest < Rails::Generators::TestCase
  tests RailsEmbedEditor::InstallGenerator
  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
  end

  test 'Assert all files are properly created' do
    run_generator
    assert_file 'config/initializers/rails_embed_editor.rb'
  end
end