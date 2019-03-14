class Post < ApplicationRecord

  validates :title, presence: true
  # validates :sub_id, :ensure_array_length

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

  has_many :postsubs, dependent: :destroy, inverse_of: :post
  
  has_many :subs,
    through: :postsubs,
    source: :sub
  

 
end
