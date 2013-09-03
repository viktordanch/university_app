class CreateAssignmentTypes < ActiveRecord::Migration
  def change
    create_table :assignment_types do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
  end
end
