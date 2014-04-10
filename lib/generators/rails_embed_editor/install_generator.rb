require 'rails/generators'
module RailsEmbedEditor
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    desc 'Creates a InstallGenerator initializer and copy locale files to your application.'

    def install
      template 'initializer.rb', 'config/initializers/rails_embed_editor.rb'
    end
  end
end