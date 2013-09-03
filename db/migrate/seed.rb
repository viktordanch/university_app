
university = University.create(:name => "university3")
course1 = university.courses.create(course_number: 1, name: 'firts', description: 'first course for you')
course2 = university.courses.create(course_number: 2, name: 'second', description: 'second course for you')
domain1 = university.domains.create(name: 'domain')
domain2 = university.domains.create(name: 'domain2')

course1.students.create(:email => 'user_1@mail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_1', :last_name=> 'user_1', :university=>'user_1_university')
course1.students.create(:email => 'user_2@mail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_2', :last_name=> 'user_1', :university=>'user_1_university')
course2.students.create(:email => 'user_1@mail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_1', :last_name=> 'user_1', :university=>'user_1_university')
course2.students.create(:email => 'user_4@mail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_2', :last_name=> 'user_1', :university=>'user_1_university')

assignment1 = course1.assignment_types.create(:name=> 'math', :weight=>'It programing')
  assignment = assignment1.assignments.create(:assigned_on=>'21/08/2013 17:15:04', :due_on=>'21/0/2013 17:15:04', :name=>'name_1', :created_by=>'user1' )
    #assignment.grades.create( :score=>'20%', :scored_from=>'20%', :grade_type=>'11')
assignment2 = course1.assignment_types.create(:name=> 'math2', :weight=>'It programing2')
  assignment = assignment1.assignments.create(:assigned_on=>'21/08/2013 17:15:04', :due_on=>'21/0/2013 17:15:04', :name=>'name_1', :created_by=>'user1' )
    #assignment.grades.create( :score=>'20%', :scored_from=>'20%', :grade_type=>'11')
puts "----------------------------------------------------------"
puts "-------------------seeds have creates-----------------------"
puts "----------------------------------------------------------"