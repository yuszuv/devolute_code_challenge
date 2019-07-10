require 'dry/validation'

require 'devolute_code_challenge/operation'
require 'devolute_code_challenge/main/import'

module DevoluteCodeChallenge
  module Main
    module Operations
      class SignIn < Operation
        include Import[
          'core.authentication.encrypt_password',
          'repo' => 'repositories.user'
        ]

        def call(input)
          data = yield validate(input)
          user = yield fetch(data[:username])
          yield authenticate(user.encrypted_password, data[:password])

          Success(user)
        end

        private

        def validate(input)
          val = Class.new(Dry::Validation::Contract) do
            params do
              required(:username).filled(:string)
              required(:password).filled(:string)
            end

          end.new.(input)

          val.success? ? Success(val.to_h) : Failure(val)
        end

        def fetch(username)
          Success(repo.by_username(username))
        rescue => e
          Failure(e)
        end

        def authenticate(encrypted_password, raw_password)
          if encrypt_password.(raw_password) == encrypted_password
            Success()
          else
            Failure()
          end
        end

      end
    end
  end
end
