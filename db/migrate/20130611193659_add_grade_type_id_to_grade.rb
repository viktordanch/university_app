class AddGradeTypeIdToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :grade_type_id, :integer
  end
end
