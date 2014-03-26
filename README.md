rails_embed_editor
==================
[![Build Status](https://travis-ci.org/timcolonel/rails_embed_editor.svg?branch=master)](https://travis-ci.org/timcolonel/rails_embed_editor) [![Coverage Status](https://coveralls.io/repos/timcolonel/rails_embed_editor/badge.png?branch=master)](https://coveralls.io/r/timcolonel/rails_embed_editor?branch=master) [![Code Climate](https://codeclimate.com/github/timcolonel/rails_embed_editor.png)](https://codeclimate.com/github/timcolonel/rails_embed_editor)


#Installation
Install the gem
```ruby
gem 'rails_embed_editor', :github => 'timcolonel/rails_embed_editor'
```
Include the assests
```erb
  <%= javascript_include_tag 'rails_embed_editor/application' if Rails.env.development? %>
  <%= stylesheet_link_tag 'rails_embed_editor/application' if Rails.env.development? %>
```
#How it work
Use the method helper to generate an editor
```ruby
rails_embed_editor(somefile, options)
```

You can give the follwoing options:
* `first_line` The first line to read
* `last_line` The last line to read
* `line` The line where the editor will be centered(To be used with `radius`)
* `radius` The radius around the given line (To be used with `line`)
* `editormode` Set what the editor can do. (Add `RailsEmbedEditor::EditorMode::` in front)
 * `READONLY` The editor will only be able to show the content 
 * `READWRIE` The editor will start in readonly mode but an option to enable editing is displayed
 * `WRITE` The editor start in edit mode

Example: (This will read 2 line around line 5 in the file `welcome/how.html.erb`)
```erb  
<%= rails_embed_editor("#{Rails.root}/app/views/welcome/show.html.erb", :line => 5, :radius => 2, 
:editormode => RailsEmbedEditor::EditorMode::READ_WRITE) %>
```

This is what the editor looks like
![capture](https://f.cloud.github.com/assets/1031227/2528947/4a6d1588-b515-11e3-99f2-3d6a6627d8fe.PNG)



