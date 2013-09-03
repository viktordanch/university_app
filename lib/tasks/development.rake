# Rake task to generate testing data for use in the development environment

require 'populator'
require 'faker'
require 'ext/faker'
require 'database_cleaner'

namespace :dev do

	# Creates Universities, Courses, Students, and Enrollments
	task :setup => :environment do

		# clean the database
		DatabaseCleaner.strategy = :truncation
		DatabaseCleaner.start
		DatabaseCleaner.clean

		# create ten universities and their corresponding domains
		University.create(name: "Case Western Reserve").domains.create(name: "case.edu")
		University.create(name: "University of Southern California").domains.create(name: "usc.edu")
		University.create(name: "Georgia Tech").domains.create(name: "gatech.edu")
		University.create(name: "Purdue").domains.create(name: "purdue.edu")
		University.create(name: "Virginia Tech").domains.create(name: "vt.edu")
		University.create(name: "Emory").domains.create(name: "emory.edu")
		University.create(name: "Harvard").domains.create(name: "harvard.edu")
		University.create(name: "Princeton").domains.create(name: "princeton.edu")
		University.create(name: "Duke").domains.create(name: "duke.edu")
		University.create(name: "Ohio State").domains.create(name: "osu.edu")

		# create 100 random courses and assign them (randomly) to the ten different universities
		Course.populate 100 do |course|
			course.university_id = Array(1...10)
			fake_course = Faker::Course.name
			course.name = fake_course.split('-')[0].strip
			course.course_number = fake_course.split('-')[1].strip
			course.description = "Monday, Wednesday, Friday @ 2:00pm"
		end

		# create 400 different students
		# password for all accounts 'test1234'
		Student.populate 100 do |student|
			student.first_name = Faker::Name.first_name
			student.last_name = Faker::Name.last_name
			student.email = "#{Faker::Internet.user_name}@#{Faker::University.domain}"
			student.encrypted_password = '$2a$10$dggRr7MIW2QX0i7sMSBk6.ZlSctxBS7GBQioPDGIlZcC1ZPtKe6Eu'
		end

		# creates 2000 different enrollments and randomly assigns the 100 students to the 400 courses
		Enrollment.populate 2000 do |enrollment|
			enrollment.course_id = Array(1..100)
			enrollment.student_id = Array(1..100)
		end

	end

	# Creates assignments and grades for a student
	task :assignments, [:student_id] => :environment do |task, args|

		# clean only the assignment and assignment_types tables in the database
		DatabaseCleaner.strategy = :truncation, {:only => %w[assignments assignment_types grade_types grades]}
		DatabaseCleaner.start
		DatabaseCleaner.clean

		# create two grade types: projected and actual
		actual = GradeType.create(name: "actual", description: "a true grade")
		projected = GradeType.create(name: "projected", description: "a projected grade")

		student = Student.find(args[:student_id])
		student.courses.each do |c|
			# time ranges 
			assigned_on_from = 12.days.ago
			assigned_on_to = 3.days.ago

			due_on_from = 3.days.from_now
			due_on_to = 12.days.from_now

			# create assignment types
			midterm = c.assignment_types.create(name: "Midterm", weight: 20)
			final = c.assignment_types.create(name: "Final", weight: 30)
			exam = c.assignment_types.create(name: "Exam", weight: 20)
			homework = c.assignment_types.create(name: "Homework", weight: 15)
			quiz = c.assignment_types.create(name: "Quiz", weight: 15)

			# create a midterm exam
			a = midterm.assignments.create(
							name: "Midterm Exam",
							assigned_on: Time.at(rand_in_range(assigned_on_from.to_f, assigned_on_to.to_f)), 
							due_on: Time.at(rand_in_range(due_on_from.to_f, due_on_to.to_f)))
			
			# create an actual or projected grade for assignment (type chosen randomly)
			create_random_grade(student, a, projected, actual)

			# create a final
			a = final.assignments.create(
							name: "Final Exam", 
							assigned_on: Time.at(rand_in_range(assigned_on_from.to_f, assigned_on_to.to_f)), 
							due_on: Time.at(rand_in_range(due_on_from.to_f, due_on_to.to_f)))

			# create an actual or projected grade for assignment (type chosen randomly)
			create_random_grade(student, a, projected, actual)


			3.times do |x|
				a = exam.assignments.create(
							name: "Exam #{x + 1}", 
							assigned_on: Time.at(rand_in_range(assigned_on_from.to_f, assigned_on_to.to_f)), 
							due_on: Time.at(rand_in_range(due_on_from.to_f, due_on_to.to_f)))

				# create an actual or projected grade for assignment (type chosen randomly)
				create_random_grade(student, a, projected, actual)
			end

			10.times do |x|
				a = homework.assignments.create(
							name: "Homework #{x + 1}", 
							assigned_on: Time.at(rand_in_range(assigned_on_from.to_f, assigned_on_to.to_f)), 
							due_on: Time.at(rand_in_range(due_on_from.to_f, due_on_to.to_f)))
				
				# create an actual or projected grade for assignment (type chosen randomly)
				create_random_grade(student, a, projected, actual)
			end

			5.times do |x|
				a = quiz.assignments.create(
							name: "Quiz #{x + 1}", 
							assigned_on: Time.at(rand_in_range(assigned_on_from.to_f, assigned_on_to.to_f)), 
							due_on: Time.at(rand_in_range(due_on_from.to_f, due_on_to.to_f)))

				# create an actual or projected grade for assignment (type chosen randomly)
				create_random_grade(student, a, projected, actual)
			end
		end
	end

	def self.create_random_grade(student, assignment, projected, actual)
		grade = [actual, projected].sample.grades.build(score: rand_in_range(0, 100), scored_from: 100)
		grade.student_id = student.id
		grade.assignment_id = assignment.id
		grade.save!
	end

	def rand_in_range(from, to)
		rand * (to - from) + from
	end

 end

