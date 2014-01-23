class Waiter < Employee

	attr_accessor :restaurant, :client_order
	attr_reader :name, :address, :phone, :comment, :password

	def initialize(name, address, phone, comment, password, restaurant)
		@name = name
		@address = address
		@phone = phone
		@comment = comment
		@password = password
		@restaurant = restaurant
		@client_order = []
	end

	def order_reception
		puts "Bonjour ! Voici notre menu: \n "
		puts restaurant.pretty_menu
		puts "Que desirez-vous commander ?"
		order = gets.chomp

		total = 0

		while order
			break if order.empty?
			restaurant.menu.each do |dish, price| 
														if dish.include?(order)
															total += price
															restaurant.cashier(price)
															@client_order << dish
														end
													end
				puts "Désirez-vous autre chose ? Autrement, appuyez sur entrée."
				order = gets.chomp
		end
		puts "Vous avez commandé: #{@client_order}"
		puts "Le total de votre commande s'élève à #{total} €." 	
	end

	def add_client
		puts "\nC'est à quel nom ?"
	 	client_name = gets.chomp

	 	puts "Et votre adresse ?"
	 	client_address = gets.chomp

	 	puts "Le code de votre immeuble ?"
	 	client_digicode = gets.chomp

	 	puts "Votre numéro de téléphone ?"
	 	client_phone = gets.chomp

	 	restaurant.client_database(client_name, @client_order, client_address, client_digicode, client_phone)
	end

	def to_s
		puts "Qu'aimeriez-vous faire ?"

		puts "Ajouter un client"
		puts "Ajouter une commande"
		puts "Voir les commandes en cours"
		puts "Annuler une commande en cours"
		puts "Afficher l'historique des commandes"
	end
end


