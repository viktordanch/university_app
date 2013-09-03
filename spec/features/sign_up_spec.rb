require 'spec_helper'

describe "the signup process" do
  
  it "registers a new student" do
    student = FactoryGirl.create(:student)
    visit new_student_registration_path
    fill_in "First name", with: student.first_name
    fill_in "Last name", with: student.last_name
    fill_in "Email", with: student.email
    fill_in "Password", with: student.password
    fill_in "Password confirmation", with: student.password_confirmation
    click_button "Sign up"
  end
  
end