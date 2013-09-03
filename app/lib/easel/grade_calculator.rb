module Easel
	class GradeCalculator

		# calculates the overall course average
		def overall_average(course)


		end

		# calculates the average score on an assignment
		def self.assignment_average(assignment)
			if !(assignment.nil?)	
				# sum up the assignment scores
				sum = 0;
				assignment.grades.each do |g|
					sum = sum + g.score
				end
				# return the average
				sum.to_f/(assignment.grades.count)
			end
		end

		# calculates the actual average for a student
		def self.student_actual_average(student)

		end

		# calculates the projected average for a student
		def self.student_projected_average(student)

		end
	end
end