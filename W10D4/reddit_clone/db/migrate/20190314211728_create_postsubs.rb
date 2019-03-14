class CreatePostsubs < ActiveRecord::Migration[5.2]
  def change
    create_table :postsubs do |t|
      t.integer :post_id, null: false, index: true
      t.integer :sub_id, null: false, index: true
      t.timestamps
    end
  end
end
