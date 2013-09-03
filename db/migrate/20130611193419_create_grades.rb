class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :score
      t.integer :scored_from

      t.timestamps
    end
  end
end
