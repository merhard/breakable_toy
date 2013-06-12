class AddNullFalseConstraintToSportName < ActiveRecord::Migration
  def up
    change_column :sports, :name, :string, null: false
  end

  def down
    change_column :sports, :name, :string, null: true
  end
end
