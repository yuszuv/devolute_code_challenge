require "pathname"
require "dry/web/container"
require "dry/system/components"

module DevoluteCodeChallenge
  module Main
    class Container < Dry::Web::Container
      require root.join("system/devolute_code_challenge/container")
      import core: DevoluteCodeChallenge::Container

      configure do |config|
        config.root = Pathname(__FILE__).join("../../..").realpath.dirname.freeze
        config.logger = DevoluteCodeChallenge::Container[:logger]
        config.default_namespace = "devolute_code_challenge.main"
        config.auto_register = %w[lib/devolute_code_challenge/main]
      end

      load_paths! "lib"
    end
  end
end
