require 'devolute_code_challenge/repository'

module DevoluteCodeChallenge
  module Main
    module Repositories
      class User < Repository[:users]
        commands :create

        def by_username(username)
          users.by_username(username).one!
        end
      end
    end
  end
end
