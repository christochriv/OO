class Employee

	attr_reader :name, :password, :phone, :comment, :password

	def initialize(name, address, phone, commment, password)
		@name = name
		@address = address
		@phone = phone
		@comment = comment
		@password = password
	end

	def name
		@name
	end

	def password
		@password
	end
end



