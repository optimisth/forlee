class AddNoShowToBulletin < ActiveRecord::Migration
  def change
    add_column :bulletins, :no_show, :boolean
  end
end
