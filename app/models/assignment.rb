class Assignment < ActiveRecord::Base
  attr_accessible :assigned_on, :due_on, :name, :created_by
  
  has_many :grades
  belongs_to :assignment_type
  
  def average
  	Easel::GradeCalculator.assignment_average(self)
  end

end



