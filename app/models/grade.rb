class Grade < ActiveRecord::Base
  attr_accessible :score, :scored_from, :grade_type ,  :student_id,  :grade_type_id
  
  belongs_to :grade_type
  belongs_to :assignment
  belongs_to :student

  
  
  def self.student_grade_on_assignment(student, assignment)
  	Grade.where(student_id: student.id , assignment_id: assignment.id)
  end

end
