class CreateDvps < ActiveRecord::Migration
  def change
    create_table :dvps do |t|
      t.references :study
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
