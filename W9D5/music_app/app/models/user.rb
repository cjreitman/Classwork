class User < ApplicationRecord
  
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  
  after_initialize :ensure_session_token

  attr_reader :password

  # def self.find_by_session_token
  #   User.find_by(session_token: session[:session_token])
  # end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.is_password?(password)
    user 
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
