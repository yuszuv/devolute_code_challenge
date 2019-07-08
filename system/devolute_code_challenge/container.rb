require "dry/web/container"
require "dry/system/components"
require 'dry-monitor'
Dry::Monitor.load_extensions(:rack)

module DevoluteCodeChallenge
  class Container < Dry::Web::Container
    configure do
      config.name = :devolute_code_challenge
      config.listeners = true
      config.default_namespace = "devolute_code_challenge"
      config.auto_register = %w[lib/devolute_code_challenge]
    end

    load_paths! "lib"
  end
end
