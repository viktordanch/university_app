EaselStudent::Application.routes.draw do    
  	
  	devise_for :students

	resources :enrollments
	resources :universities

	resources :notifications

	resources :grades
	
	resources :courses

	resources :assignments
	resources :assignment_types

	root to: 'dashboard#index'

end