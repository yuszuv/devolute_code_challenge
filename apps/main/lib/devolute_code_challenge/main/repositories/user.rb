require 'devolute_code_challenge/repository'

module DevoluteCodeChallenge
  module Main
    module Repositories
      class User < Repository[:users]
        commands :create
      end
    end
  end
end
