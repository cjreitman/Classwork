FactoryBot.define do
  factory :user do
    username { Faker::Movies::PrincessBride.character }
    password_digest { BCrypt::Password.create("hotsauce") }
    session_token { SecureRandom.urlsafe_base64(16) }
  end
end
