class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :assigned_on
      t.datetime :due_on
      
      t.timestamps
    end
  end
end
