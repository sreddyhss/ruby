class Client < ActiveRecord::Base
  has_many :projects

  validates_presence_of :name, :company
  validates_presence_of :website, message: "Contact us if you require a website"

  
  def list_projects
  	Project.where('client_id = ?',id)
  end

  def find_all_new_projects
  	projects = list_projects

  	Project.where('client_id = ? AND Project.find(client_id).status=?', id, "new")
  end

  def find_completed_projects
    Project.where('client_id=? AND Project.find(client_id).status=?', id, "completed")
  end

  def tree_display
    "Client - #{name}"
  end
end
