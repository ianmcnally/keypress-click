###
  keypressClick - v 0.0.3, by Ian McNally

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

  bound = true

  (_s, element, attrs) ->
    keyCode = keyToCode attrs.keypressClick
    listenersCount = 0

    click = (evt) ->
      if bound and evt.keyCode is keyCode and !element.is ':disabled'
        element.click()

    bind = ->
      bound = true

    unbind = ->
      bound = false

    angular.element('input').on 'focus', unbind
    angular.element('textarea').on 'focus', unbind
    angular.element('input').on 'blur',  bind
    angular.element('textarea').on 'blur',  bind

    angular.element(document).bind 'keydown', click

    bind()
