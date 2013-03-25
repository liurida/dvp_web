class AddDomainToEcItem < ActiveRecord::Migration
  def change
    add_column :ec_items, :domain_id, :integer
    add_index :ec_items, :domain_id
  end
end
