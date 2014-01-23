require 'CSV'
require_relative 'cookbook'
require_relative 'csvmanager'

french_recipes = CookBook.new('recipes.csv')

puts "##########################"
puts "---- My CookBook ----"
puts "##########################"
puts "What do you want to do?"
puts "- List all recipes [list]"
puts "- Add a recipe [add]"
puts "- Delete a recipe [del <recipe_id>]"
puts "- Exit [exit]"

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
				
		end
		puts "What now ?"
end


#array.each_with_index {|x, y| print x if y.odd? } 




