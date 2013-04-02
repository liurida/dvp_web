class AddCheckMethodToEcItems < ActiveRecord::Migration
  def change
    add_column :ec_items, :check_method, :string
  end
end
