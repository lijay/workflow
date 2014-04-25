class AddCheckToItem < ActiveRecord::Migration
  def change
  	add_column :items, :checked, :boolean
  end
end
