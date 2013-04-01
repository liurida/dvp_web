class RemoveCompiledStatusFromEcItem < ActiveRecord::Migration
  def up
    remove_column :ec_items, :compiled_status
  end

  def down
    add_column :ec_items, :compiled_status, :string
  end
end
