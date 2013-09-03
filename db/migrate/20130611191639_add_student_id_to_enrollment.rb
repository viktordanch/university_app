class AddStudentIdToEnrollment < ActiveRecord::Migration
  def change
    add_column :enrollments, :student_id, :integer
  end
end
