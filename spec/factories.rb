FactoryGirl.define do
  
  factory :university do
  	name "Case Western Reserve"
  end
  
  factory :course do
  	name "Phys 121"
  	university
  end

  factory :student do 
  	first_name "Abdallah"
  	last_name "Soliman"
    email { "#{last_name}@case.edu" }
    password 'test1234'
    password_confirmation 'test1234'
  end

  factory :domain do 
  	name "case.edu"
  	university
  end

  factory :enrollment do
    course
    student
  end

  factory :assignment_type do
    name "Exam"
    weight "20"
    course
  end

  factory :assignment do
    name "Exam 1"
    assignment_type
  end

  factory :grade_type do
    name "Actual Grade"
    description "An actual grade"
  end

  factory :grade do
    score 80
    scored_from 100

    student
    assignment
    grade_type
  end

end
