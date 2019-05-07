class User < ApplicationRecord

  has_many :watch_lists,
    class_name: 'WatchList',
    foreign_key: :user_id

   

end
