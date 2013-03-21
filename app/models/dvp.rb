class Dvp < ActiveRecord::Base
  attr_accessible :desc, :name, :study_id
  has_one :study
end
