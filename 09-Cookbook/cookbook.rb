require_relative 'csvmanager'

class CookBook
	
	def initialize(file_name)
		@csv_manager = CsvManager.new(file_name)
		@recipes = @csv_manager.read
	end

	def list
		@recipes
	end

	def add(name)
		@recipes << [name]
		save
	end

	def del(idx)
		@recipes.delete_at(idx)
		save
	end

	def save
		@csv_manager.save(@recipes)
	end

end


