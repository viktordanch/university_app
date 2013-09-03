class AddAssignmentIdToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :assignment_id, :integer
  end
end
