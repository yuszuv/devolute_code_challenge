# auto_register: false

require "rom-repository"
require "devolute_code_challenge/container"
require "devolute_code_challenge/import"

module DevoluteCodeChallenge
  class Repository < ROM::Repository::Root
    include Import.args["persistence.rom"]
  end
end
