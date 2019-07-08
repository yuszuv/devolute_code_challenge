# auto_register: false

require "slim"
require "dry/view"
require "devolute_code_challenge/container"

module DevoluteCodeChallenge
  class View < Dry::View
    configure do |config|
      config.paths = [Container.root.join("web/templates")]
      config.default_context = Container["view_context"]
      config.layout = "application"
    end
  end
end
