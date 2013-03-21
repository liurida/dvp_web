class Study < ActiveRecord::Base
  attr_accessible :name, :title, :type
  has_many :dvps
end
