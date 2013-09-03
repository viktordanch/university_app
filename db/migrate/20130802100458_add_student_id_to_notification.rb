class AddStudentIdToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :student_id, :integer
  end
end
