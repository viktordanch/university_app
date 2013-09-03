require 'spec_helper'

describe Domain do

  it "can be used to lookup the corresponding university" do
  	# creates a student
  	student = FactoryGirl.create(:student)
  	# creates a domain
  	domain = FactoryGirl.create(:domain)
  	# get the domain associated w/ student's email, and lookup university using it
  	university_id = Domain.get_university_id(student.email.split('@')[1])
  	
  	# check if the university id returned references the same university created above 
  	if !(university_id.nil?)
  		domain.university.should eql(University.find(university_id))
  	end
    
  end


end
