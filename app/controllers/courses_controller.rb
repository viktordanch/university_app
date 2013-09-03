class CoursesController < ApplicationController

	def show

		projected = GradeType.where(name: "projected").first
		actual = GradeType.where(name: "actual").first

		@course = current_student.courses.find(params[:id])

		# retrieve all of student's projected grades for assignments in this course
		@projected_grades = current_student.grades.where(assignment_id: @course.assignments).where(grade_type_id: projected)
		# retrieve all of student's actual grades for assignments in this course
		@actual_grades = current_student.grades.where(assignment_id: @course.assignments).where(grade_type_id: actual)
  	# for a new assignment
		@assignment = Assignment.new

		respond_to do |format|
			format.html {render 'show'}
			format.js
		end

	end

end

