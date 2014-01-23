class Delivery < Restaurant

	attr_reader :name, :address, :phone, :restaurant

	def initialize(name, address, phone, restaurant)
		super
	end

	def to_s
		puts "**************************************"
		puts "(Vous entendez toquer à votre porte.)"
		puts "Bonjour ! Yé soui José, lé livreur ..."
		puts "Vou z'avoir commandé : "

		restaurant.client_database(client_name, @client_order, client_address, client_digicode, client_phone)
	end
		

end
