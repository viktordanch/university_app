class Course < ActiveRecord::Base
  attr_accessible :course_number, :name, :description
  
  has_many :enrollments
  has_many :students, :through => :enrollments

  has_many :assignment_types
  has_many :assignments, through: :assignment_types

  belongs_to :university

  def self.get_courses_by_university_id(university_id)
    where("university_id = ?", university_id)
  end

  
  
end
