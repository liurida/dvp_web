class CreateStudyMembers < ActiveRecord::Migration
  def change
    create_table :study_members do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
    add_index :study_members, :user_id
    add_index :study_members, :role_id
  end
end
