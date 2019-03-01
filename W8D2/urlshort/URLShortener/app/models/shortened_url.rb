require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true
    validates :user_id, presence: true

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
    
	has_many :visits,
		class_name: :Visit,
    foreign_key: :shortenedurl_id,
    primary_key: :id

  has_many :visitors
    through: :visits
    source: 

  def self.converter(user, long_url)
    thing = ShortenedUrl.new(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
    thing.save!
  end

  def self.random_code
    short = SecureRandom.urlsafe_base64(16)

    until !ShortenedUrl.exists?(:short_url => short)
      short = SecureRandom.urlsafe_base64(16)
    end

    short
  end


end

