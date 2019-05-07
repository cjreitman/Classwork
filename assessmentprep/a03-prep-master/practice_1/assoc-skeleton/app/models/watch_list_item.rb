class WatchListItem < ApplicationRecord

  belongs_to :watch_list,
    class_name: 'WatchList',
    foreign_key: :watch_list_id

  belongs_to :company,
    class_name: 'Company',
    foreign_key: :company_id

    

end
