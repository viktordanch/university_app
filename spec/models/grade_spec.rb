require 'spec_helper'

describe Guard do

  it "can retrieve a grade using student and assignment ids" do
  	
    grade = FactoryGirl.create(:grade)

    # tests the method "student_grade_on_assignment"
    grade_retrieved = Grade.student_grade_on_assignment(grade.student, grade.assignment)

    grade.should eql(grade_retrieved.first)

  end

end