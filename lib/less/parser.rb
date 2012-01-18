module Less
  class ParseError < StandardError; end

  # Convert lesscss source into an abstract syntax Tree
  class Parser
    class << self
      def backend
        @backend ||= ExecJS::ExternalRuntime.new(
          :name        => 'Node.js (V8)',
          :command     => ["nodejs", "node"],
          :runner_path => File.expand_path("../runner.js", __FILE__)
        )
      end
    end

    # Construct and configure new Less::Parser
    #
    # @param [Hash] opts configuration options
    # @option opts [Array] :paths a list of directories to search when handling \@import statements
    # @option opts [String] :filename to associate with resulting parse trees (useful for generating errors)
    def initialize(options = {})
      @options = Less.defaults.merge(options)
      @context = self.class.backend.compile(compiler_source)
    end

    # Convert `less` source into a abstract syntaxt tree
    # @param [String] less the source to parse
    # @return [Less::Tree] the parsed tree
    def parse(less)
      Tree.new(less, @context, @options)
    end

    protected
      def compiler_source
        File.read(File.expand_path("../compiler.js", __FILE__))
      end
  end

  # Abstract LessCSS syntax tree Less. Mainly used to emit CSS
  class Tree
    def initialize(less, context, options)
      @less    = less
      @context = context
      @options = options
    end

    def to_css(options = {})
      @result ||= @context.call("render", @less, @options.merge(options))
    rescue ExecJS::ProgramError => e
      raise ParseError.new(e.message)
    end
  end
end