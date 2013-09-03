class EnrollmentsController < ApplicationController

def create
	@student = current_student
	@course = Course.find(params[:enrollment][:course_id])
	@student.enrollments.create(course: @course)
	
	respond_to do |format|
		flash[:notice] = "Course added successfully."
		format.html {redirect_to root_path}
		format.js 
	end

	# if ajax request, clear flash so notice doesnt appear on reload
	flash.discard if request.xhr?

end

def index

	# determines university student is affiliated with from domain portion of email
	current_student.university = University.find(Domain.get_university_id(current_student.email.split('@')[1]))
	# retrieve courses currently enrolled in
	@enrolled_in = current_student.courses
	# retrieve courses offered by university to which student is affiliated & student not enrolled in
	@courses = Course.get_courses_by_university_id(current_student.university.id).reject { |c| @enrolled_in.include? c }
	
	@enrollment = Enrollment.new

	respond_to do |format|
		format.js
	end
end

end
