module Test
  module DatabaseHelpers
    module_function

    def rom
      DevoluteCodeChallenge::Container["persistence.rom"]
    end

    def db
      DevoluteCodeChallenge::Container["persistence.db"]
    end
  end
end
