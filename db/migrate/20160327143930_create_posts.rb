class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :bulletin_id
      t.string :title
      t.string :description
      t.text :content

      t.timestamps null: false
    end
    add_index :posts, :bulletin_id
  end
end
