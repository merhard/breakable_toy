class AddValidationsToLocationModel < ActiveRecord::Migration
  def up
    change_column :locations, :street_address, :string, null: false
    change_column :locations, :city, :string, null: false
    change_column :locations, :state, :string, null: false
    change_column :locations, :zip, :string, null: false
  end

  def down
    change_column :locations, :street_address, :string, null: true
    change_column :locations, :city, :string, null: true
    change_column :locations, :state, :string, null: true
    change_column :locations, :zip, :string, null: true
  end
end
