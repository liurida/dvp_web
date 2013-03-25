class Study < ActiveRecord::Base
  attr_accessible :name, :title
  has_many :dvps

  def to_s
    self.name
  end
end
