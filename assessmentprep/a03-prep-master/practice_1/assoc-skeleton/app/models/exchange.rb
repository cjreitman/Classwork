class Exchange < ApplicationRecord

  has_many :companies,
    class_name: 'Company',
    foreign_key: :exchange_id

end
