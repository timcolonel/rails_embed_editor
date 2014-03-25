#
#= require_tree .
#= require ace/ace
#= require ace/mode-ruby
#= require ace/theme-monokai

$(document).ready () ->
  window.load_rails_embed_code_editor()


window.load_rails_embed_code_editor = () ->
  $('.rails_embed_code_editor').each () ->
    container = $(this)
    options = {
      theme: container.data('theme')
      mode: container.data('mode')
      firstLineNumber: container.data('first-line')
      readonly: container.data('readonly') == 'true'
    }
    setup_editor(container[0], options)

setup_editor = (element, options) ->
  defaults = {
    theme: 'monokai'
    mode: 'ruby'
    firstLineNumber: 1
    readonly: false
  }
  options = $.extend({}, defaults, options);
  editor = ace.edit(element)
  editor.commands.removeCommand('replace')
  editor.setTheme("ace/theme/" + options['theme']);
  editor.getSession().setMode("ace/mode/" + options['mode']);
  editor.setOption("firstLineNumber", options['firstLineNumber'])
  editor.setReadOnly(options['readonly'])