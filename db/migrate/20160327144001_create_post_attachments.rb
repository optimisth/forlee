class CreatePostAttachments < ActiveRecord::Migration
  def change
    create_table :post_attachments do |t|
      t.integer :post_id
      t.string :avatar

      t.timestamps null: false
    end
    add_index :post_attachments, :post_id
  end
end
