class Executive < ApplicationRecord

  has_many :memberships,
    class_name: 'BoardMembership',
    foreign_key: :member_id

  has_many :boards,
    through: :memberships,
    source: :board

end
