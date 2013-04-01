class RemoveRemovedFromEcItem < ActiveRecord::Migration
  def up
    remove_column :ec_items, :removed
  end

  def down
    add_column :ec_items, :removed, :string
  end
end
