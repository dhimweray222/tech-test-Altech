require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(username: "example_user", email: "user@example.com", password: "password123")
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user = User.new(email: "user@example.com", password: "password123")
    expect(user).to_not be_valid
  end

  it "has a valid email format" do
    user = User.new(username: "example_user", email: "user@example.com", password: "password123")
    expect(user.email).to match URI::MailTo::EMAIL_REGEXP
  end

  it "is not valid with an invalid email format" do
    user = User.new(username: "example_user", email: "invalid_email", password: "password123")
    expect(user).to_not be_valid
  end
end
