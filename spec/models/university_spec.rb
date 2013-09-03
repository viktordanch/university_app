require 'spec_helper'

describe University do

  it "can be used to retrieve courses offered by a particular university" do
  	# creates a course
  	course = FactoryGirl.create(:course)
  	# gets the courses associated with university using university_id parameter
  	retrieved_courses = Course.get_courses_by_university_id(course.university.id)  
  	puts retrieved_courses
  	if !(retrieved_courses.nil?)
  		retrieved_courses.first.should eql(course)
  	end
  end

end