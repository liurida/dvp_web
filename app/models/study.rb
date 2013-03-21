class Study < ActiveRecord::Base
  attr_accessible :name, :title
  has_many :dvps
end
