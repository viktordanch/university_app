class GradesController < ApplicationController

	def update	

		respond_to do |format|

			grade = Grade.find(params[:id])


      puts '-------------------------------------------------------------'
      puts "------------------------#{grade.inspect}-------------------------------------"
      puts '-------------------------------------------------------------'
			# if grade score is updated successfully, create a flash notification to inform the user
			if grade.update_attribute(:score, params[:grade][:score])
				flash[:notice] = "#{grade.assignment.name} projection updated successfully."
				format.js
			end

		end

		# if ajax request, clear flash so notice doesnt appear on reload
		flash.discard if request.xhr?
	end

end