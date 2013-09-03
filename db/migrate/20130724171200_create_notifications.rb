class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :message
      t.boolean :dismissed
      t.datetime :notify_at

      t.timestamps
    end
  end
end
