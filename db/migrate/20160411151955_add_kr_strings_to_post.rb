class AddKrStringsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title_kr, :string
    add_column :posts, :description_kr, :string
    add_column :posts, :content_kr, :string
  end
end
