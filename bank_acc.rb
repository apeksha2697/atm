class Account
  @@acc_details = []
  @@acc_counter = 0
  @@acc_no = 0
  attr_accessor :acc_no
  attr_accessor :balance
  attr_accessor :name

  def initialize(acc_no,balance,name)
    @acc_no = acc_no
    @balance = balance
    @name = name
  end

  def self.create_acc(name)
    @@acc_counter += 1
    acc_no = @@acc_counter
    balance = 0
    acc_obj = Account.new(acc_no,balance,name)
    @@acc_details << acc_obj
  end

  def self.acc_details
    @@acc_details
  end
  
  def self.delete_acc(acc_no)
    index = -1
    @@acc_details.each do |account|
      index += 1
      if acc_no == account.acc_no 
        @@acc_details.delete_at(index)
        break
      end
      if index == @@acc_details.length-1 && acc_no != account.acc_no
        puts "Invalid account no"
      end
    end
  end

  def self.list_all_acc
    @@acc_details.each do |account|
      puts "Account number: #{account.acc_no}"
    end
    if @@acc_details.length == 0
      puts "No record found"
    end
  end

  def self.select_acc(acc_no)
    if acc_no != 0
      @@acc_details.each do |account|
        if acc_no == account.acc_no 
        @@acc_no = account.acc_no 
        end
      end
    end
    if @@acc_no == 0
      puts "Invalid account number"
      @@acc_no = 0
    end
  end

  def self.check_balance
    @@acc_details.each do |account|
      if @@acc_no == account.acc_no 
        puts "Balance: #{account.balance}"
      end
    end
  end

  def self.deposit_money(amount)
    if amount > 0
      @@acc_details.each do |account|
        if @@acc_no == account.acc_no 
          account.balance = account.balance + amount
        end
      end
    end
  end

  def self.withdraw_money(amount)
    if amount > 0
      @@acc_details.each do |account|
        if @@acc_no == account.acc_no 
          if amount > account.balance
            puts "Insufficient balance"
          else 
            account.balance = account.balance - amount
          end
        end
      end
    end
  end
  
  def self.delete
    @@acc_details = []
    @@acc_counter = 0
    @@acc_no = 0
  end

   def self.exit
    @@acc_no = 0
  end

end
