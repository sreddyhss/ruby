class ProjectsController < ApplicationController

def index
	if params[:status].nil?
		@projects = Project.all
	elsif params[:status] == "new"
		@projects = Project.where('status = ?', params[:status])
	elsif params[:status] == "completed"
		@projects = Project.where('status = ?', params[:status])
	elsif params[:status] == "on-going"
		@projects = Project.where('status = ?', params[:status])
	elsif params[:status] == "archived"
		@projects = Project.where('status = ?', params[:status])
	else
	    @projects = []			
end

def create
end

def new
	@project = Project.new
end

def edit
end

def show
end

def update
end

def destory
end

private

def project_params
  params[:project].permit(:name, :description, :start_date, :status, :client_id)
end

end
