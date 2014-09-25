
/*
  keypressClick - v 0.0.3, by Ian McNally

  An Angular directive to click an element on keypress.
 */

(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  angular.module('keypressClick', []).directive('keypressClick', function() {
    var UnrecognizedKeyExpressionError, bound, keyToCode, keymap;
    UnrecognizedKeyExpressionError = (function(_super) {
      __extends(UnrecognizedKeyExpressionError, _super);

      function UnrecognizedKeyExpressionError(exp) {
        this.name = 'UnrecognizedKeyExpressionError';
        this.message = "keypressNgClick called with invalid keycode expression: " + exp;
      }

      return UnrecognizedKeyExpressionError;

    })(Error);
    keymap = {
      esc: 27,
      space: 32,
      enter: 13
    };
    keyToCode = function(key) {
      var code;
      code = keymap[key] || key;
      if (!!code.toString().match(/^\d+$/g)) {
        return Number(code);
      }
      throw new UnrecognizedKeyExpressionError(key);
    };
    bound = true;
    return function(_s, element, attrs) {
      var bind, click, keyCode, listenersCount, unbind;
      keyCode = keyToCode(attrs.keypressClick);
      listenersCount = 0;
      click = function(evt) {
        if (bound && evt.keyCode === keyCode && !element.is(':disabled')) {
          return element.click();
        }
      };
      bind = function() {
        return bound = true;
      };
      unbind = function() {
        return bound = false;
      };
      angular.element('input').on('focus', unbind);
      angular.element('textarea').on('focus', unbind);
      angular.element('input').on('blur', bind);
      angular.element('textarea').on('blur', bind);
      angular.element(document).bind('keydown', click);
      return bind();
    };
  });

}).call(this);
