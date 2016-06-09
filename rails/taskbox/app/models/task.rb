class Task < ActiveRecord::Base

	belongs_to :project

	#validate :check_due_date

	def tree_display
      "Task - #{name}"
	end

	private

	#def check_due_date
     # if !(due_date).nil? && due_date < project.start_date
      #	errors.add(:due_date, " of task should be greater than #{project.start_date}")
      #end
	#end
end
