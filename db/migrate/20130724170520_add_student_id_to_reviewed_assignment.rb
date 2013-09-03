class AddStudentIdToReviewedAssignment < ActiveRecord::Migration
  def change
    add_column :reviewed_assignments, :student_id, :integer
  end
end
