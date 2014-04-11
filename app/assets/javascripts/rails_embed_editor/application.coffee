#
#= require_tree .
#= require ace/ace
#= require ace/mode-ruby
#= require ace/theme-monokai
#= require ace/theme-github

window.rails_embed_editor_default_theme ?= 'github'
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
      highlight: compute_range(container.data('highlight'), container.data('first-line'))
    }
    setup_editor(container[0], options)


setup_editor = (element, options) ->
  defaults = {
    theme: window.rails_embed_editor_default_theme
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

  #highlight the current line only if its focus
  editor.setHighlightActiveLine(false)
  editor.on "focus", () ->
    editor.setHighlightActiveLine(true)
  editor.on "blur", () ->
    editor.setHighlightActiveLine(false)

  editor.getSession().addMarker(options['highlight'], "editor_highlight", "text") unless options['highlight'] == null

  if options['editormode'] != 'readonly'
    options['last_line'] ?= options['firstLineNumber'] + editor.session.getLength()

    button = $('<div><button class="rails_embed_code_editor_button">Save</button></div>').appendTo(element).children()
    button.text('Enable edit') if options['editormode'] == 'readwrite'
    button.click () ->
      if options['editormode'] != 'readonly'
        if options['editormode'] == 'readwrite' and editor.getReadOnly()
          button.text('Save')
          editor.setReadOnly(false)
        else
          $.post('/rails_embed_editor/edit', {
            content: editor.getValue()
            first_line: options['first_line']
            last_line: options['last_line']
            filename: options['filename']
          }).success (data) ->
            if data['success'] == true
              button.text('Saved!')

            else
              button.text('Error')
              console.log('Error saving:' + data['message'])
            setTimeout(() ->
              button.text("Save")
            , 2000)

compute_range = (str, line = 1) ->
  offset = parseInt(line)
  return null if str == undefined
  _array = str.toString().split(',')
  for i in [0..._array.length]
    _array[i] = parseInt(_array[i])
  switch _array.length
    when 1
      new Range(_array[0] - offset, 0, _array[0] - offset, Infinity)
    when 2
      new Range(_array[0] - offset, 0, _array[1] - offset, Infinity)
    when 4
      new Range(_array[0] - offset, _array[1], _array[2] - offset, _array[3])
    else
      null