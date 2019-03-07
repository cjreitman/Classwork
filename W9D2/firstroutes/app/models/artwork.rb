class Artwork < ApplicationRecord

  validates :title, null: false, uniqueness: { scope: :artist_id, message: 
  "Artist cannot have two pieces with the same title" }
  validates :image_url, presence: true, uniqueness: true
  
end

