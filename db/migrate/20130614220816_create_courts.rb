class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.integer :number_of
      t.integer :location_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
