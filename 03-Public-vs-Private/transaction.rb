class Transaction

	attr_accessor :history
  
  def initialize
    @history = {}
  end
  
  def account_operations(var)
  	var.each do |a|
		@history[Time.now] = a
		end 
  end

  def to_s
    @history.each_pair do |a, b|
    	puts "#{b} euros on the #{a}"
    end
  end
end