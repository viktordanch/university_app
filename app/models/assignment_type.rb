class AssignmentType < ActiveRecord::Base
  attr_accessible :name, :weight
  
  has_many :assignments
  belongs_to :course
end
