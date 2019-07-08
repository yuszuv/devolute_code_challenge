require "devolute_code_challenge/main/view"

module DevoluteCodeChallenge
  module Main
    module Views
      class Welcome < View
        configure do |config|
          config.template = "welcome"
        end
      end
    end
  end
end
