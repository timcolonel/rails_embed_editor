#
#= require_tree .
#= require ace/ace
#= require ace/mode-ruby
#= require ace/theme-monokai
Range = require('ace/range').Range
$(document).ready () ->
  window.load_rails_embed_code_editor()


window.load_rails_embed_code_editor = () ->
  $('.rails_embed_code_editor').each () ->
    container = $(this)
    options = {
      theme: container.data('theme')
      mode: container.data('mode')
      filename: container.data('filename')
      first_line: container.data('first-line')
      last_line: container.data('last-line')
      editormode: container.data('editormode')
    }
    setup_editor(container[0], options)


setup_editor = (element, options) ->
  defaults = {
    theme: 'monokai'
    mode: 'ruby'
    firstLineNumber: 1
    editormode: 'readonly'
  }
  options = $.extend({}, defaults, options);
  editor = ace.edit(element)
  editor.commands.removeCommand('replace')
  editor.setTheme("ace/theme/" + options['theme']);
  editor.getSession().setMode("ace/mode/" + options['mode']);
  editor.setOption("firstLineNumber", options['first_line'])
  editor.setReadOnly(options['editormode'] != 'write')
  editor.setAutoScrollEditorIntoView();
  editor.setOption("maxLines", 40);
  editor.setOption("minLines", 5);
  editor.getSession().addMarker(new Range(3, 0, 3, Infinity), "warning", "text");

  if options['editormode'] != 'readonly'
    options['last_line'] ?= options['firstLineNumber'] + editor.session.getLength()

    button = $('<div><button class="rails_embed_code_editor_button">Save</button></div>').appendTo(element).children()
    button.text('Enable edit') if options['editormode'] == 'readwrite'
    button.click () ->
      if options['editormode'] == 'readwrite'
        button.text('Save')
        editor.setReadOnly(false)
      else
        $.post('/rails_embed_editor/edit', {
          content: editor.getValue()
          first_line: options['first_line']
          last_line: options['last_line']
          filename: options['filename']
        }).success (data) ->
          console.log(data)
