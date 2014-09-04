###
  keypressClick - v 0.0.2, by Ian McNally

  An Angular directive to click an element on keypress.
###
angular.module('keypressClick', []).directive 'keypressClick', ->

  class UnrecognizedKeyExpressionError extends Error
    constructor : (exp) ->
      @name = 'UnrecognizedKeyExpressionError'
      @message = "keypressNgClick called with invalid keycode expression: #{exp}"

  keymap =
    esc : 27
    space : 32
    enter : 13

  keyToCode = (key) ->
    code = keymap[key] or key
    return Number(code) unless !code.toString().match /^\d+$/g
    throw new UnrecognizedKeyExpressionError(key)

  (_s, element, attrs) ->
    keyCode = keyToCode attrs.keypressClick

    click = (evt) ->
      if evt.keyCode is keyCode
        element.click() unless element.is ':disabled'

    addListener = ->
      angular.element(document).on 'keydown', click

    removeListener = ->
      angular.element(document).off 'keydown', click

    angular.element('input').on 'focus', removeListener
    angular.element('textarea').on 'focus', removeListener
    angular.element('input').on 'blur', addListener
    angular.element('textarea').on 'blur', addListener

    addListener()
