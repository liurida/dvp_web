class AddRemovedToEcItem < ActiveRecord::Migration
  def change
    add_column :ec_items, :removed, :string
  end
end
