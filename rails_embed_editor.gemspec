$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'rails_embed_editor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_embed_editor'
  s.version     = RailsEmbedEditor::VERSION
  s.authors     = ['Timothee Guerin']
  s.email       = ['timothee.guerin@outlook.com']
  s.homepage    = 'http://github.com/timcolonel/rails_embed_editor'
  s.summary     = 'A tool that allow to display a embed editor on your page and edit local file(Views, Controller, ...)'
  s.description = 'A tool that allow to display a embed editor on your page and edit local file(Views, Controller, ...). Details otw'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0', '>=4.0.0'
  s.add_dependency 'ace-rails-ap'
  s.add_dependency 'json'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'cancan'
  s.add_development_dependency 'tzinfo-data'
end
