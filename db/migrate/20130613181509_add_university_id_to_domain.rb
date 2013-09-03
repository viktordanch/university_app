class AddUniversityIdToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :university_id, :integer
  end
end
