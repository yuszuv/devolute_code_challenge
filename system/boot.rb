require "bundler/setup"

begin
  require "pry-byebug"
rescue LoadError
end

require_relative "devolute_code_challenge/container"

DevoluteCodeChallenge::Container.finalize!

# Load sub-apps
app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each do |f|
  require "#{f}/system/boot"
end

require "devolute_code_challenge/web"
