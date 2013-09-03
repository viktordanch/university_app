class AddAssignmentIdToReviewedAssignment < ActiveRecord::Migration
  def change
    add_column :reviewed_assignments, :assignment_id, :integer
  end
end
