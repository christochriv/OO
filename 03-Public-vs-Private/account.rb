require_relative 'transaction.rb'

class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :iban, :initial_deposit, :password, :transactions, :position
  
  MIN_DEPOSIT = 100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password  
    @transaction = Transaction.new
    @name, @iban = name, iban
    @position = 0
    add_transaction(initial_deposit)
  end
    
  def position
    puts @position
  end

  def withdraw(amount)
    add_transaction(-amount)
    puts "You've just withdrawn #{amount} euros"
  end
  
  def deposit(amount)
    add_transaction(amount)
    puts "You've just made a #{amount} euros deposit"
  end
  
  def transactions_history(args = {})
      if args[:password] == @password
        puts "Here is the history of your transactions :"
        print @transaction
      elsif args.empty?
        puts "No password given"
      else
        puts "Wrong password"
      end
  end
  
  def iban
    return "#{@iban.to_s[0,4]}**************************#{@iban.to_s[-3,3]}"
  end
  
  def to_s
    return "Owner: #{@name}\nIBAN: #{iban}\nCurrent amount: #{@position} euros"
  end
          
  private  
  
  def add_transaction(money_flush)
    @position = @position + money_flush
    @transaction.account_operations(money_flush)
  end
    
end

######################################################################################################

account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given

puts account.position == 435 # => true

#too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
