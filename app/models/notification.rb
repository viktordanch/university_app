class Notification < ActiveRecord::Base
  attr_accessible :dismissed, :message, :notify_at, :student
end
