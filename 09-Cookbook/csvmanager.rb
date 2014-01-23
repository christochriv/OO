require 'CSV'

class CsvManager
	def initialize(csv_file)
		@csv_file = csv_file
	end

	def read
		CSV.read(@csv_file)
	end

	def save(data)
		CSV.open(@csv_file, "w+") do |csv|
			data.each {|line| csv << line}
		end
	end

end
