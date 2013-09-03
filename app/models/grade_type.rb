class GradeType < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :grades
  
  def projected?
	self.name == "projected"
  end

end
