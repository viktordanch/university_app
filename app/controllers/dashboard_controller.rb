class DashboardController < ApplicationController


def index


  def index
    #if no domain in university
    if !(Domain.get_university_id(current_student.email.split('@')[1])).blank?
      # determines university student is affiliated with from domain portion of email
      current_student.university = University.find(Domain.get_university_id(current_student.email.split('@')[1]))
      # retrieve courses currently enrolled in
      @enrolled_in = current_student.courses
      # retrieve courses offered by university to which student is affiliated & student not enrolled in
      @courses = Course.get_courses_by_university_id(current_student.university.id).reject { |c| @enrolled_in.include? c }

      @enrollment = Enrollment.new
    else
      flash[:error] = "No university with domain #{current_student.email.split('@')[1]}."
    end


   end

end

end

