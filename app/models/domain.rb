class Domain < ActiveRecord::Base
  attr_accessible :full_name, :name
  has_many :ec_items

  def to_s
    self.name
  end
end
