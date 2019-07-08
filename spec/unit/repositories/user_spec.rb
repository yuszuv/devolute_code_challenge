require 'web_spec_helper'

require 'devolute_code_challenge/main/repositories/user'

RSpec.describe DevoluteCodeChallenge::Main::Repositories::User do

  subject(:repo) do
    described_class.new()
  end

  let(:username){ "john.doe" }
  let(:encrypted_password){ Digest::SHA2.hexdigest("password") }

  it "can persist a user with username and encrypted password" do
    res = repo.create(username: username, encrypted_password: encrypted_password)

    expect(res.username).to eq username
    expect(res.encrypted_password).to eq encrypted_password
  end

end
