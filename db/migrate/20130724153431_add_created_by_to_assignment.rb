class AddCreatedByToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :created_by, :string
  end
end
