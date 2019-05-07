class WatchList < ApplicationRecord

  belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id

  has_many :watch_list_items,
    class_name: 'WatchListItem',
    foreign_key: :watch_list_id  
end
