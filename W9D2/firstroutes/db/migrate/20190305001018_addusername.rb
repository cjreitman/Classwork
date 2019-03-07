class Addusername < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, uniqueness: true
  end
end
