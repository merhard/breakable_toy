class RemoveZipFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :zip
  end

  def down
    add_column :locations, :zip, :string
  end
end
