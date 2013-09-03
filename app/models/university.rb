class University < ActiveRecord::Base
  attr_accessible :name
  
  has_many :courses
  has_many :domains

end
