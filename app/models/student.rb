class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :university
  # attr_accessible :title, :body
  
  attr_accessor :university


  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :grades
  has_many :reviewed_assignments
  has_many :assignments, through: :reviewed_assignments
  
end
