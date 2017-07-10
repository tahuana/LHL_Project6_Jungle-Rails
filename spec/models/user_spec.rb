require 'rails_helper'

RSpec.describe User, type: :model do

  # before :each do
  #   @user = User.create(first_name: "Ed", last_name: "Smith", email: "test@test.com", password: "1", password_confirmation: "1")
  # end

  context "Password:" do

    it "User should have password" do
      @user = User.create(first_name: "Ed", last_name: "Smith", email: "test@test.com", password_confirmation: "1")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "User should have confirm password" do
      @user = User.create(first_name: "Ed", last_name: "Smith", email: "test@test.com", password: "1")
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "User should have password = confirm password" do
      @user = User.create(first_name: "Ed", last_name: "Smith", email: "test@test.com", password: "2", password_confirmation: "1")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

  context "Email:" do

    it "User should have email" do
      @user = User.create(first_name: "Carl", last_name: "Mill", password: "1", password_confirmation: "1")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "Email should be unique" do
      @user = User.create(first_name: "Ed", last_name: "Smith", email: "TEST@TEST.com", password: "1", password_confirmation: "1")
      expect(@user.valid?).to eq(true)
      @user2 = User.create(first_name: "Ed2", last_name: "Smith2", email: "test@test.COM", password: "2", password_confirmation: "2")
      expect(@user2.valid?).to eq(false)
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

  end

  context "Name:" do

    it "User should have first name" do
      @user = User.create(last_name: "Smith", email: "ex1@test.com", password: "1", password_confirmation: "1")
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "User should have last name" do
      @user = User.create(first_name: "Smith", email: "ex1@test.com", password: "1", password_confirmation: "1")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

  end

end
