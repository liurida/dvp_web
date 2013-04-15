class AddStudyIdToStudyMember < ActiveRecord::Migration
  def change
    add_column :study_members, :study_id, :integer
  end
end
