class CreateReviewedAssignments < ActiveRecord::Migration
  def change
    create_table :reviewed_assignments do |t|

      t.timestamps
    end
  end
end
