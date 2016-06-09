class Project < ActiveRecord::Base

  belongs_to :client
  has_many :tasks, dependent: :destroy

  validates :status, presence: true
  validates_length_of :description, maximum: 100

  def details
    "#{name} - #{status} - #{start_date} - #{Client.find(client_id).name}"
  end

  def list_tasks
  	Task.where('project_id = ?', id)
  end

  def self.list_new_projects
  	Project.where('status = ?',"new")
  end

  def list_completed_tasks
  	Task.where('project_id = ? AND is_completed = ?',id,"true")
  end

  def tree_display
  	"Project - #{name}"
  end
end
