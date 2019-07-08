# auto_register: false

require 'dry/monads/result'
require 'dry/monads/do/all'

module DevoluteCodeChallenge
  class Operation
    def self.inherited(subclass)
      subclass.include Dry::Monads::Result::Mixin
      subclass.include Dry::Monads::Do::All
      subclass.include Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)
    end
  end
end
