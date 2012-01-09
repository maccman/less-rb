require 'execjs'
require 'less/parser'
require 'less/version'
require 'less/defaults'

module Less
  extend Less::Defaults

  def self.compile(css, options = {})
    Parser.new(options).parse(css).to_css
  end

  def self.bundled_path
    File.expand_path('../less/js/lib', __FILE__)
  end

  # Exports the `.node_modules` folder on the working directory so npm can
  # require modules installed locally.
  ENV['NODE_PATH'] = "#{File.expand_path('node_modules')}:#{bundled_path}:#{ENV['NODE_PATH']}"
end