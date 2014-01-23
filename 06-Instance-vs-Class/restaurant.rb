class Restaurant

	class << self
		attr_reader :number_of_rating
	end

	@number_of_rating = 0 # Variable d'instance de la classe

	def initialize(name, address, rating, type_of_food)
		@name = name
		@address = address
		@type_of_food = type_of_food
		@ratings = []
	end

	#def self.total_rating_getter
		#@number_of_rating
	#end 
		# <=== remplacé par les lignes 3, 4, 5

	def self.total_rating_writer
		@number_of_rating += 1
	end

	def rate(rating)
		@ratings << rating 
		Restaurant.total_rating_writer
	end

	def average
		@ratings.inject { |sum, el| sum + el }.to_f / @ratings.size
	end

	def to_s
		"Welcome to the #{@name}, situated at #{@address} - #{@type_of_food} food style. It has an average score of #{average}."
	end
end


########################################################################################

resto_1 = Restaurant.new("L'orange lunatique", "26 rue du temps perdu", 9, "Fusion")
resto_2 = Restaurant.new("A la Lune mélancolique", "37 rue du temps retrouvé", 8, "Fusion")


resto_1.rate(10)
resto_1.rate(6)
resto_1.rate(8)
resto_1.rate(8)
resto_1.rate(9)
resto_1.rate(9)
resto_1.rate(3)

resto_2.rate(10)
resto_2.rate(2)
resto_2.rate(2)
resto_2.rate(3)
resto_2.rate(8)
resto_2.rate(9)
resto_2.rate(9)

puts resto_1
puts " "
puts resto_2
puts " "
puts "Nombre de notes : #{Restaurant.number_of_rating}"


