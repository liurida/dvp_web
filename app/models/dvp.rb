class Dvp < ActiveRecord::Base
  attr_accessible :desc, :name, :study_id
  belongs_to :study
  has_many :ec_items

  def to_s
    "#{self.study.name}-#{self.name}"
  end
end
