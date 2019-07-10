require "devolute_code_challenge/main/view"

module DevoluteCodeChallenge
  module Main
    module Views
      class SignIn < View
        configure do |config|
          config.template = "sign_in"
        end
      end
    end
  end
end

