class CreateEcItems < ActiveRecord::Migration
  def change
    create_table :ec_items do |t|
      t.string :name
      t.string :proc_name
      t.string :description
      t.string :message
      t.string :reviewer
      t.string :author
      t.string :type
      t.string :compiled_status
      t.string :tested_status
      t.string :creation_ts
      t.string :modification_ts
      t.string :modified_by
      t.references :study
      t.references :dvp

      t.timestamps
    end
    add_index :ec_items, :study_id
    add_index :ec_items, :dvp_id
  end
end
