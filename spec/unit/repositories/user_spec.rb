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

  context "with a user persisted" do

    let(:username){ 'john.doe' }

    before(:each) do
      Factory[:user, username: username]
    end

    describe "checking for existence" do

      it "returns true for an existing username" do
        expect(repo.exists?(username)).to be true
      end

      it "returns false a non-existsing username" do
        expect(repo.exists?("hans.wurst")).to be false
      end
    end

  end

end
