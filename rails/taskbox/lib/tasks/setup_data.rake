desc "Fake data"
task :setup_data => :environment do 
   15.times do 
   	client = Client.new
   	client.name = Faker::Name.first_name 
   	client.company = Faker::Company.name 
   	client.email = Faker::Internet.free_email(client.name)
   	client.mobile = Faker::Number.number(10)
   	client.save
   	
end

end