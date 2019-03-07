require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  Colors = %w(black calico orange gray white blue striped)

  validates :color, inclusion: { in: Colors }, null: false
  validates :name, null: false, uniqueness: true
  validates :birth_date, null: false
  validates :sex, inclusion: { in: ['M', 'F'] }, null: false

  def self.colors
    %w(black calico orange gray white blue striped)
  end

  def age
    Time.now.year - birth_date.year 
  end


end
