require 'rails_helper'

RSpec.describe User, type: :model do
 
  subject(:user) do 
    FactoryBot.build(:user, username: "Koy", password: "hotsauce")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "Creates a password_digest when a password is given" do 
    expect(user.password_digest).to_not be_nil
  end

  it "ensures that password is not equal to password_digest" do
    expect(user.password).to_not eq(user.password_digest)
  end

  it "Creates a session_token before validation" do
    user.valid? 
    expect(user.session_token).to_not be_nil
  end

  describe "reset_session_token!" do 
    it "sets a new session_token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
    end

    it "return the new session_token" do
      expect(user.reset_session_token!).to equal(user.session_token)
    end
  end

  describe "is_password?" do 
    it "verifies the password is correct" do 
      expect(user.valid_password?("hotsauce")).to be true
    end
  end

  describe "find_by_credentials" do 
    before { user.save! }
    it "will return an instance of user given valid credentials" do 
      expect(User.find_by_credentials("Koy", "hotsauce")).to eq(user)
    end

    it "return nil if no user found" do 
      expect(User.find_by_credentials("Colin", "hotsauce")).to eq(nil)
    end

  end

  


end
