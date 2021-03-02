class Bank_account
    attr_accessor :bank_name, :acc_num, :balance
    def initialize(bank_name, acc_num, balance=0)
        @bank_name = bank_name
        @acc_num = acc_num
        @balance = balance
    end        
    def transfer(amount, destination_acc)
        @balance -= amount
        destination_acc.balance += amount
    end
    def details
        puts "Cuenta del: #{@bank_name}, numero: #{@acc_num}, tiene un balance total de: #{@balance}"
    end    
end    

class User
    def initialize(username, acc_portfolio)
        @username = username
        @acc_portfolio = acc_portfolio
    end       
    def total_balance
        total = []
        @acc_portfolio.each do |i|
            total.push(i.balance)
        end
        total = total.inject(:+)
        puts "El balance total para el portafolio de cuentas del usuario #{@username} es de: #{total} colones."            
    end             
end    

# Instantiate 2 Bank_account objects:
account_1 = Bank_account.new('BCR', '12345678', 5000)
account_2 = Bank_account.new('BN', '87654321', 5000)

# Transfer balance from account 1 to account 2, using Bank_account.transfer method.
account_1.transfer(2000, account_2)

# Console log account one and 2 details with Bank_account.details method. 
puts account_1.details
puts account_2.details

# The following array is for testing purposes on User.total_balance method.
accounts = [account_1, account_2]

# Instantiate an object from class User
fabian = User.new('Fabian Conejo', accounts)

# Test User.total_balancce method.
fabian.total_balance