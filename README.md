## less-rb

less-rb allows you to compile [Less CSS files](http://lesscss.org/) from Ruby.

To install:

    gem install less-rb

To use:

    require 'less-rb'
    Less::Parser.compile("body { background: darken(#CCC, 10%) }")

These bindings also integrate with [Tilt](https://github.com/rtomayko/tilt) and [Sprockets](https://github.com/sstephenson/sprockets), so work seamlessly with Rails.

## Requirements

[Node.js](http://nodejs.org) needs to be installed, and in the path.

## About

These are Ruby bindings for the next generation LESS, which is implemented in JavaScript.

These are separate from the [official bindings](https://github.com/cowboyd/less.rb), as they've been ported to [ExecJS](https://github.com/sstephenson/execjs). This means you don't have to re-compile v8 every deploy.

For more information, visit <http://lesscss.org>.

## Usage

less-rb exposes the `less.Parser` constructor to ruby code via `Less::Parser`. You can instate it
context free:

    parser = Less::Parser.new

or with configuration options:

    parser = Less::Parser.new :paths => ['./lib', 'other/lib'], :filename => 'mystyles.less'

Once you have a parser instantiated, you can parse code to get your AST !

    tree = parser.parse(".class {width: 1+1}") # => Less::Tree
    tree.to_css #=> .class {\n  width: 2;\n}\n
    tree.to_css(:compress => true) #=> .class{width:2;}

There's a shortcut for this whole routine:

    Less::Parser.compile(css, options)

## Credits

This library was ported from [less.rb](https://github.com/cowboyd/less.rb) also using the Apache License. It was created by [Alex MacCaw](http://alexmaccaw.com) ([@maccman](http://twitter.com/maccman)).