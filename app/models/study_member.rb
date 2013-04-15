class StudyMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :study

  # attr_accessible :title, :body
  attr_accessible :user_id, :study_id, :role_id
end
