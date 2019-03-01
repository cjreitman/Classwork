class Visit < ApplicationRecord
    validates :user_id, presence: true
    validates :shortenedurl_id, presence: true

    belongs_to :visited_

    def self.record_visit!(user, shortened_url)
        thing = Visit.new(user_id: user.id, shortenedurl_id: shortened_url.id)
        thing.save!
    end
end