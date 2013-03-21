class AddRestrictionToEcItem < ActiveRecord::Migration
  def change
    add_column :ec_items, :restriction, :string
  end
end
