class Study < ActiveRecord::Base
  attr_accessible :name, :title
  has_many :dvps
  has_many :study_members

  def to_s
    self.name
  end
end
