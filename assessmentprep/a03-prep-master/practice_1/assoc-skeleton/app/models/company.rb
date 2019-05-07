class Company < ApplicationRecord

  belongs_to :exchange,
    class_name: 'Exchange',
    foreign_key: :exchange_id,
    primary_key: :id,
    optional: true

  has_many :prices,
    class_name: 'Price',
    foreign_key: :company_id,
    primary_key: :id

  has_one :board,
    class_name: 'Board',
    foreign_key: :company_id

  has_many :watch_lists,
    



end
