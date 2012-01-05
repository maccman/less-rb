less.rb
=======

The **dynamic** stylesheet language.

<http://lesscss.org>

about
-----

These are Ruby bindings for the next generation LESS, which is implemented in JavaScript.

These are seperate from the [official bindings](https://github.com/cowboyd/less.rb), as they've been ported to [ExecJS](https://github.com/sstephenson/execjs). This means you don't have to re-compile v8 every deploy.

For more information, visit <http://lesscss.org>.

usage
------

less.rb exposes the `less.Parser` constructor to ruby code via `Less::Parser`. You can instate it
context free:

    parser = Less::Parser.new

or with configuration options:

    parser = Less::Parser.new :paths => ['./lib', 'other/lib'], :filename => 'mystyles.less'

Once you have a parser instantiated, you can parse code to get your AST !

    tree = parser.parse(".class {width: 1+1}") # => Less::Tree
    tree.to_css #=> .class {\n  width: 2;\n}\n
    tree.to_css(:compress => true) #=> .class{width:2;}
