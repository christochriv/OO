class Transaction
  
  def initialize(amount)
    @amount = amount
    @date = Time.new
    @reason = "no given"
  end

  def to_s
    if amount > 0
    	"You withdrew #{@amount} euros on the #{@date.strftime("%Y-%m-%d")}."
    else
      "You withdrew #{-@amount} euros on the #{@date.strftime("%Y-%m-%d")}."
    end
  end
end