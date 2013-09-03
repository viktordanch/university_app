module Easel
	class Notifier

		def self.notify_all_new_assignment(assignment)

			# get all students in the course
			students_to_notify = assignment.assignment_type.course.students

			# the base attributes are the same for each student
			base_notifications_attributes = {message: "#{assignment.created_by} has added a new assignment #{assignment.name}"}

			# create new hash of attributes for each student to be notified
			attributes = students_to_notify.map {|student| base_notifications_attributes.merge(:student => student) }

			Notification.create(base_notifications_attributes)

		end

	end
end