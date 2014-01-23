require_relative 'cookbook'
require 'Nokogiri'
require 'open-uri'

class Parser < CookBook

	def initialize(chosen_ingredient)
		super
		@chosen_ingredient = chosen_ingredient
	end

	def open
		@html_file = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{@chosen_ingredient}")
		@new_recipes = Nokogiri::HTML(@html_file)
	end

	def search
		@new_recipes.search('.m_search_titre_recette').each do |element|
		add(element.search('.m_search_titre_recette > a').inner_text)
			end
	end
			

			

end