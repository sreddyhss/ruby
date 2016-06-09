class ClientsController < ApplicationController

def index
	@clients = Client.all
end

def new
	@client = Client.new
end

def create
	@client = Client.new(client_params)
    if @client.save
    	redirect_to clients_path, notice: "Successfully created the client"
    else
    	render action: 'new'
    end
end

def edit
	@client = Client.find(params[:id])
end

def show
	begin
		@client = Client.find(params[:id])
		@new_projects = @client.projects.where('status=?',"new")
		@completed_projects = @client.projects.where('status=?',"completed")

		@archived_projects = @client.projects.where('status=?',"archived")
	rescue
		redirect_to clients_path, notice: "The record doesn't exist"
	end
end

def update
	@client = Client.find(params[:id])
	if @client.update_attributes(client_params)
		redirect_to clients_path(@client), notice: "Successfully updated client"
	else
		render action: 'edit'
	end
end

def destroy
	@client = Client.find(params[:id])
	@client.destroy
	redirect_to clients_path, notice: "#{@client.name} has been deleted"
end

private

def client_params
	params[:client].permit(:name, :company, :email, :mobile, :website)
end

end
