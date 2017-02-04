task :create_authors => :environment do
	5.times do 
		Author.create(name: Faker::Name.name, city: Faker::Address.city, birth_date:"02/02/1990")
	end
end