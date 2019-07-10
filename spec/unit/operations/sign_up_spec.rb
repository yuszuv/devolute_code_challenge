require 'web_spec_helper'

require 'authentication/encrypt_password'

RSpec.describe DevoluteCodeChallenge::Main::Operations::SignUp do

  subject(:sign_up) do
    described_class.new(
      encrypt_password: encrypt_password,
      repo: users_repo
    )
  end

  let(:encrypt_password){ instance_double(Authentication::EncryptPassword) }
  let(:users_repo){ instance_double(DevoluteCodeChallenge::Main::Repositories::User) }
  let(:username){ "jane@doe.org" }

  context "with valid input" do

    let(:input) { { username: username, password: "foo", password_confirmation: 'foo' } }

    it "runs successfully" do
      expect(encrypt_password).to receive(:call)
      expect(users_repo).to receive(:create)
      expect(users_repo).to receive(:exists?).with(username){ false }

      res = sign_up.(input)

      expect(res).to be_success
    end

  end

  context "with invalid input" do

    let(:input) { { username: "jane@doe.org", password: "foo", password_confirmation: 'bar' } }

    it "runs unsuccessfully" do
      expect(encrypt_password).to_not receive(:call)
      expect(users_repo).to receive(:exists?).with(username){ false }

      res = sign_up.(input)

      expect(res).to_not be_success
    end

  end

  context "a user with the same username already exists" do

    let(:input) { { username: username, password: "foo", password_confirmation: 'foo' } }

    it "runs unsuccessfully" do
      expect(users_repo).to receive(:exists?).with(username){ true }

      res = sign_up.(input)

      expect(res).to_not be_success
    end

  end
end
