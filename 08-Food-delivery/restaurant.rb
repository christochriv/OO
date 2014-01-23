class Restaurant
	
	def initialize(name, address, phone)
		@name = name
		@address = address
		@phone = phone
		@client_database = {}
	end

	def menu
		menu = { 
		"Le Tibétain"    => 10,
		"Le Chinois"     => 7,
		"Le Péruvien"    => 8,
		"Le Brésilien"   => 12,
		"Le Japonais"    => 13,
		"L'Ouzbek"       => 15,
		"Le Thaïlandais" => 9,
		"Le Spécial Mack"=> 20, 
		"Le Groenlandais"=> 25,
					}			
	end

	def pretty_menu
		return menu.each {|a, b| puts "#{a} : #{b}" }
	end

	def cashier(amount)
		money_flow = []
		money_flow << amount
		t = 0
		all_the_strogoff_money = money_flow.each {|a| a + t}			
	end

	def auth
		puts "Bienvenue au Strogoff !"
		puts "-------------------------------"
		puts "Veuillez entrer votre nom d'utilisateur:"
		answer_username = gets.chomp
		puts "Veuillez entrer votre mot de passe:"
		answer_password = gets.chomp
			if answer_username == Employees.name && answer_password == Employees.password
				puts "Bienvenue, #{answer_username}. Votre niveau d'accès : #{status}"
				puts "-------------------------------"
				puts "Qu'aimeriez-vous faire ?"
				puts "Options :"
				puts answer_username
			else
				puts "Wrong Username / Password"	
		end
	end

	def client_database(client_name, client_order, client_address, client_digicode, client_phone)
		@client_database[:client_name] = [client_order, client_address, client_digicode, client_phone]
	end

	def employees_database(employee_name, employee_address, employee_phone, employee_comment, employee_password)
		employees_database = {}
		employees_database[:employee_name] = [employee_address, employee_phone, employee_comment, employee_password]
	end

	def restaurant_stats
		stats = { 
		"Le Tibétain"    => 0,
		"Le Chinois"     => 0,
		"Le Péruvien"    => 0,
		"Le Brésilien"   => 0,
		"Le Japonais"    => 0,
		"L'Ouzbek"       => 0,
		"Le Thaïlandais" => 0,
		"Le Spécial Mack"=> 0, 
		"Le Groenlandais"=> 0
					}
	end

end