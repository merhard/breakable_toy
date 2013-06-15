class AddValidationsToCourtModel < ActiveRecord::Migration
  def up
    change_column :courts, :number_of, :integer, null: false
    change_column :courts, :sport_id, :integer, null: false
    change_column :courts, :location_id, :integer, null: false
  end

  def down
    change_column :courts, :number_of, :integer, null: true
    change_column :courts, :sport_id, :integer, null: true
    change_column :courts, :location_id, :integer, null: true

  end
end
