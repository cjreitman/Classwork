class RmvDescPresence < ActiveRecord::Migration[5.2]
  def change
    change_column :cats, :description, :text, null: true
  end
end
