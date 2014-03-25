require 'test_helper'

#Tests I18nAdminUtils::Config
class ConfigTest < ActiveSupport::TestCase
  test 'Load config fine with block' do
    RailsEmbedEditor.config do |config|

    end
  end

  test 'Test config function without param' do
    assert RailsEmbedEditor.config == RailsEmbedEditor::Config
  end
end