$LOAD_PATH << '.'
require "bank_acc"

class Main
  def self.user_string_input
    gets.chomp.downcase
  end

  def self.user_integer_input
    gets.to_i
  end

  def self.user_name
    puts "Enter the user's name"
    name = user_string_input
  end

  def self.user_acc_no
    puts "Enter account number"
    acc_no = user_integer_input
  end

  def self.amount
    puts "enter the amount"
    amount = user_integer_input
  end

  def self.main
    while true
      puts "1: create account"
      puts "2: delete account"
      puts "3: list all accounts"
      puts "4: Select an account"
      puts "5: EXIT"
      option = gets.to_i
      case option
        when 1
          Account.create_acc(name = self.user_name)
        when 2
          Account.delete_acc(acc_no = self.user_acc_no)
        when 3
          Account.list_all_acc
        when 4
         acc_no = Account.select_acc(acc_no = self.user_acc_no)
          while acc_no != 0 
            puts "1: check balance"
            puts "2: deposit money"
            puts "3: withdraw money"
            puts "4: EXIT"
            option1 = gets.to_i
            case option1
              when 1
                Account.check_balance
              when 2
                Account.deposit_money(amount = self.amount)
              when 3
                Account.withdraw_money( amount = self.amount)
              when 4
                Account.exit
                break
              else puts "Choose a valid option"
            end
          end
        when 5 
          break
        else puts "Choose a valid option"
      end
    end
  end   
end  

Main.main