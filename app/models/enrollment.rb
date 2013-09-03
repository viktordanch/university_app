class Enrollment < ActiveRecord::Base
  attr_accessible :course
  
  belongs_to :student
  belongs_to :course
  
end
