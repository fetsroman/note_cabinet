require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "password", password_confirmation: "password") }

  describe "validation" do
    it "is valid params" do
      expect(user).to be_valid
    end

    context "with invalid params" do
      it "without email" do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "without password" do
        user = User.new(password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid with a duplicate email" do
        other_user = User.new(email: user.email)
        other_user.valid?
        expect(other_user.errors[:email]).to include("has already been taken")
      end

      it "invalid confirm password" do
        user = User.new(password: "password", password_confirmation: "another_password")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "invalid password length" do
        user = User.new(password: "12345")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
  end
end
