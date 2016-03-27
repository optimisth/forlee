class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.integer :list_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
    add_index :bulletins, :list_id
  end
end
