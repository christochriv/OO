require_relative "employees.rb"
require_relative "manager.rb"
require_relative "waiter.rb" 
require_relative "restaurant.rb"
require_relative "delivery.rb"

def food_delivery
	
	strogoff = Restaurant.new("Au Strogoff", "2 avenue du temps perdu, 75017 PARIS", "0139393836")
	bob = Manager.new("Bob Morane", "3 rue de l'upercule 75023 PARIS", "0608070802", "Super Cool", "1234")
	natalia = Waiter.new("Natalia", "Кремль, Москва, Russie, 103073", "007 495 695-37-76", "Trop bonne", "Poutine Rocks", strogoff)
	jose = Delivery.new("Jose Lopez", "Rua Padre Joao Manuel 202, Jardins SAO PAULO 01411000 BRAZIL", "9898793983", strogoff)
	#walter = Cook.new("Walter White", "25 rue de la poudre 75001 PARIS", "0492947483", "Trop addict", "Breaking Bad")

	puts "Bienvenu au Strogoff! \n Etes-vous 'employé' ou 'client'?"
	answer = gets.chomp
		
		if answer == "employé"
			strogoff.auth

		elsif answer == "client"
			natalia.order_reception
			natalia.add_client
			puts jose
		end	
end


###################################################################################################

puts food_delivery


