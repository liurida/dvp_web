class AddProgrammedStatusToEcItem < ActiveRecord::Migration
  def change
    add_column :ec_items, :programmed_status, :string
  end
end
