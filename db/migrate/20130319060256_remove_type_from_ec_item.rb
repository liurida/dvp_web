class RemoveTypeFromEcItem < ActiveRecord::Migration
  def up
    remove_column :ec_items, :type
  end

  def down
    add_column :ec_items, :type, :string
  end
end
