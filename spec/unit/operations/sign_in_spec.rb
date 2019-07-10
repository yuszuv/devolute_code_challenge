require 'web_spec_helper'

RSpec.describe DevoluteCodeChallenge::Main::Operations::SignIn do

  before(:each) do
    Factory[:user, username: username, encrypted_password: encrypted_password]
  end

  subject(:sign_in) do
    described_class.new(
      encrypt_password: encrypt_password,
      repo: users_repo
    )
  end

  let(:username){ 'jane@doe.org' }
  let(:password){ 'password' }
  let(:encrypted_password){ 'xxx' }
  let(:encrypt_password){ instance_double(Authentication::EncryptPassword) }
  let(:user) { double('User', encrypted_password: encrypted_password) }
  let(:users_repo){ instance_double(DevoluteCodeChallenge::Main::Repositories::User) }

  context "with valid input" do

    let(:input) { { username: username, password: password } }

    it "runs successfully" do
      expect(users_repo).to receive(:by_username).with(username){ user }
      expect(encrypt_password).to receive(:call){ encrypted_password }

      res = sign_in.(input)

      expect(res).to be_success
    end

  end

  context "with invalid input" do

    let(:input) { { username: "jane@doe.org", password: "foobar" } }

    it "runs unsuccessfully" do
      expect(users_repo).to receive(:by_username).with(username){ user }
      expect(encrypt_password).to receive(:call).with("foobar"){ "somegibberish" }

      res = sign_in.(input)

      expect(res).to_not be_success
    end

  end
end
