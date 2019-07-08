require "devolute_code_challenge/main/view"

module DevoluteCodeChallenge
  module Main
    module Views
      class SignUp < View
        configure do |config|
          config.template = "sign_up"
        end
      end
    end
  end
end

