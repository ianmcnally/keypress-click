# keypress-click

[![Greenkeeper badge](https://badges.greenkeeper.io/ianmcnally/keypress-click.svg)](https://greenkeeper.io/)
An Angular directive to click on a keypress

## Installation
By bower:
    bower install keypress-click

Or clone this repo.

## Usage

1. Include `keypressClick` as an app dependency:
```coffee
angular.module 'myApp', ['keypressClick']
```

2. In your HTML:
```html 
<button keypress-click="esc" ng-click="submit()"></button>
```
Or:
```html
<button keypress-click="27" ng-click="submit()"></button>
```

Note: The attribute `keypress-click` maps to the keycode of the button. Some common ones have been abstracted:

`esc` - 27
`enter` - 13
`space` - 32

## Development

Run `grunt dev` to install dependencies and compile code on change.

To straight up compile, run `grunt compile`.
