module Easel
	class Reviewer

		def self.approve_assignment(student, assignment)
			reviewed_assignment = ReviewedAssignment.new
			reviewed_assignment.student = student
			reviewed_assignment.assignment = assignment
			reviewed_assignment.save!
		end

	end
end