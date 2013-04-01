class AddRemovedToEcItems < ActiveRecord::Migration
  def change
    add_column :ec_items, :removed, :boolean
  end
end
