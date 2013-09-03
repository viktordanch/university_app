class Domain < ActiveRecord::Base
  attr_accessible :name

  belongs_to :university

  # returns id of university to which domain belongs
  def self.get_university_id(domain)
  	query = where("name = ?", domain)
  	if !(query.empty?)
  		query.first.university_id
  	end
  end

end
