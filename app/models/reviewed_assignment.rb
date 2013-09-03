class ReviewedAssignment < ActiveRecord::Base
  attr_accessible :student, :assignment

  
  belongs_to :student
  belongs_to :assignment
end
