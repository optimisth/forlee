class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :post_id
      t.string :video_url

      t.timestamps null: false
    end
    add_index :videos, :post_id
  end
end
