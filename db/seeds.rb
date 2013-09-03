
university = University.create(:name => "university3")
  course1 = university.courses.create(course_number: 1, name: 'first', description: 'first course for you')
  course2 = university.courses.create(course_number: 2, name: 'second', description: 'second course for you')
  domain1 = university.domains.create(name: 'gmail.com')
  domain2 = university.domains.create(name: 'mail.com')
                    puts'-------------------------create-courses--------------------'
student1 = course1.students.create(:email => 'user_1@mail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_1', :last_name=> 'user_1', :university=>'user_1_university')
student2 = course1.students.create(:email => 'user_2@qmail.com', :password=>'qwerty11', :password_confirmation=>'qwerty11', :remember_me=>true, :first_name=> 'user_2', :last_name=> 'user_1', :university=>'user_1_university')
puts'-------------------------create-students--------------------'

assignment_type_1 = course1.assignment_types.create(name:'assignment_type_1', weight: 100)
assignment_type_2 = course1.assignment_types.create(name:'assignment_type_2', weight: 500)

puts'-------------------------create-assignment--types------------------'
assignment_1 = assignment_type_1.assignments.create(name: 'assignment_1', assigned_on: '2012-09-02 15:32:18', due_on: '2012-09-02 15:32:18', created_by: 'user_1')
assignment_2 = assignment_type_1.assignments.create(name: 'assignment_2', assigned_on: '2012-09-05 15:32:18', due_on: '2012-09-07 15:32:18', created_by: 'user_2')

assignment_3 = assignment_type_2.assignments.create(name: 'assignment_3', assigned_on: '2012-09-07 15:32:18', due_on: '2012-09-07 15:32:18', created_by: 'user_3')
assignment_4 = assignment_type_2.assignments.create(name: 'assignment_4', assigned_on: '2012-09-10 15:32:18', due_on: '2012-09-15 15:32:18', created_by: 'user_4')
puts'-------------------------create-assignment--------------------'

grade_type_1= GradeType.create(name: 'projected', description: 'text which describe this grade: projected grade')
grade_type_2= GradeType.create(name: 'actual', description: 'text which describe this grade: actual grade')

puts'-------------------------create-grades--------------------'

assignment_1.grades.create(score: 10, scored_from: 100, student_id: student1.id, grade_type_id:grade_type_1.id )
assignment_1.grades.create(score: 10, scored_from: 100, student_id: student1.id, grade_type_id:grade_type_1.id )
assignment_1.grades.create(score: 10, scored_from: 100, student_id: student1.id, grade_type_id:grade_type_2.id )
assignment_1.grades.create(score: 10, scored_from: 100, student_id: student1.id, grade_type_id:grade_type_2.id )
puts "---------------------seeds---"