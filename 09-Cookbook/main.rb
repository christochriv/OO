require 'CSV'
require 'Nokogiri'
require 'open-uri'
require_relative 'cookbook'
require_relative 'csvmanager'
require_relative 'parser'

french_recipes = CookBook.new('recipes.csv')

puts "##########################"
puts "---- My CookBook ----"
puts "##########################"
puts "-- Here are all your recipes --\n"
puts " "

# puts 1. [X] Crumpets (15 min)
# puts 2. [ ] Beans & Bacon breakfast (45 min)

puts " "
puts "What do you wanna do?"
puts " "
puts "1. Import recipes from marmiton [import]"
puts "2. List all recipes [list]"

# puts 3. See a recipe details [see <recipe_id>]
# puts 4. Mark a recipe [mark <recipe_id>]

puts "5. Add a recipe [add]"
puts "6. Delete a recipe [del <recipe_id>]"
puts "7. Exit [exit]"



while true
	answer = gets.chomp
	break if answer == "exit"

		if answer == "list"
				puts french_recipes.list
		
		elsif answer == 'add'
			puts "Which recipe do you want to add ?"
			recipe_added = gets.chomp 
			french_recipes.add(recipe_added)
				puts "Added!"
		
		elsif answer == 'del'
			puts "Which recipe do you want to delete ? Type the index."
			french_recipes.list.each_with_index {|a, b| puts b, a}
			
			index_recipe_deleted = gets.chomp.to_i
			french_recipes.del(index_recipe_deleted)
				puts "Deleted!"

		elsif answer == 'import'
			puts "Which recipes for which ingredient ?"
			ingredient = gets.chomp

			puts "Importing recipe data from marmiton for #{ingredient}..."
			
			html_file = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}")
			new_recipes = Nokogiri::HTML(html_file)

			new_recipes.search('.m_search_result').each do |element| 
			french_recipes.add(element.search('.m_search_titre_recette > a').inner_text)
  			end
			puts "Added!"	

		end
				
		puts "What now ?"
end









