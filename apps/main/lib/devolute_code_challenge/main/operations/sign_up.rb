require 'digest'
require 'dry/validation'

require 'devolute_code_challenge/operation'
require 'devolute_code_challenge/main/import'

module DevoluteCodeChallenge
  module Main
    module Operations
      class SignUp < Operation
        include Import[
          'core.authentication.encrypt_password',
          'repo' => 'repositories.user'
        ]

        def call(input)
          data = yield validate(input)

          username = data[:username]
          password_hash = encrypt_password.(data[:password])

          user = yield persist(username, password_hash)

          Success(user)
        end

        private

        def validate(input)
          val = Class.new(Dry::Validation::Contract) do
            params do
              required(:username).filled(:string)
              required(:password).filled(:string)
              required(:password_confirmation).filled(:string)
            end

            rule(:password, :password_confirmation) do
              key.failure('and password confirmation are not the same') if values[:password] != values[:password_confirmation]
            end
          end.new.(input)

          val.success? ? Success(val.to_h) : Failure(val)
        end

        def persist(username, encrypted_password)
          Success(repo.create(username: username, encrypted_password: encrypted_password))
        end

      end
    end
  end
end
