class AssignmentsController < ApplicationController

	def create
		# convert natural language date/time to real datetime
    puts "------------------------------------------------------------"
    puts "------------------#{params}-------------------------"
    puts "------------------------------------------------------------"
		if !(params[:assignment][:due_on].nil?)
			Time.zone = "EST"
			Chronic.time_class = Time.zone
			params[:assignment][:due_on] = Chronic.parse(params[:assignment][:due_on])

			params[:assignment][:assigned_on] = Chronic.parse(params[:assignment][:assigned_on])

		end


		# create new assignment using the passed in type parameter
		@assignment = AssignmentType.find(params[:assignment][:assignment_type_id]).assignments.create(name: params[:assignment][:name],
																									   assigned_on: params[:assignment][:assigned_on], 
																									   due_on: params[:assignment][:due_on],
																									   created_by: current_student)


		# create a reviewed assignment record for this user
		x = Easel::Reviewer.approve_assignment(current_student, @assignment)


		# notify all students in course	
		y = Easel::Notifier.notify_all_new_assignment(@assignment)

		respond_to do |format| 
			flash[:notice] = "Assignment #{@assignment.name} created successfully."
			format.js
		end

		# if ajax request, clear flash so notice doesnt appear on reload
		flash.discard if request.xhr?

	end

	def update
		debugger
		@assignment = Assignment.find(params[:id])
		@assignment.update_attributes(params[:assignment])

		respond_to do |format| 
			flash[:notice] = "Assignment #{@assignment.name} updated successfully."
			format.js
		end

		# if ajax request, clear flash so notice doesnt appear on reload
		flash.discard if request.xhr?

	end

end