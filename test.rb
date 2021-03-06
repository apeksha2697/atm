$LOAD_PATH << '.'
require "bank_acc"
require "minitest/autorun"

class TestAccount < Minitest::Test
  def test_to_create_acc_valid_name 
    assert_equal Account.acc_details.length, 0 
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    assert_equal Account.acc_details.length, 2
    Account.delete
  end

  def test_to_delete_acc
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    assert_equal Account.acc_details.length, 2
    acc_no = 1
    Account.delete_acc(acc_no)
    assert_equal Account.acc_details.length, 1
    acc = Account.acc_details.first
    assert_equal acc.acc_no, 2
    Account.delete
  end 

  def test_to_delete_acc_with_invalid_acc_no
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    assert_equal Account.acc_details.length, 2
    acc_no = "abc"
    Account.delete_acc(acc_no)
    assert_equal Account.acc_details.length, 2
    acc = Account.acc_details.first
    assert_equal acc.acc_no, 1
    Account.delete
  end

  def test_to_check_acc_balance
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 1
    Account.select_acc(acc_no)
    Account.check_balance
    account = Account.acc_details.first
    assert_equal account.balance, 0
    assert_equal account.acc_no, acc_no 
    Account.delete
  end

  
  def test_to_check_acc_balance_with_invalid_acc_no
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = "pqr"
    var = Account.select_acc(acc_no)
    Account.check_balance
    assert_equal 0, var
    Account.delete
  end

  def test_to_list_all_acc
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc1 = Account.acc_details.first
    acc2 = Account.acc_details.last
    Account.list_all_acc
    assert_equal acc1.acc_no, 1
    assert_equal acc2.acc_no, 2
    Account.delete
  end

  def test_to_select_acc
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 1
    Account.select_acc(acc_no)
    account = Account.acc_details.first
    assert_equal account.name, arr.first
    assert_equal account.acc_no, acc_no
    Account.delete
  end

  def test_to_select_acc_with_invalid_acc_no
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = "xdg"
    var = Account.select_acc(acc_no)
    puts var
    assert_equal 0, var
    account = Account.acc_details.first
    assert_equal account.name, arr.first
    Account.delete
  end

  def test_to_deposit_money
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 2
    amount = 2000
    Account.select_acc(acc_no)
    Account.deposit_money(amount)
    account = Account.acc_details.last
    assert_equal account.acc_no, acc_no
    assert_equal account.name, arr.last
    assert_equal account.balance, amount
    Account.delete
  end

  def test_to_deposit_money_with_invalid_details
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = "pfg"
    amount = 2000
    var = Account.select_acc(acc_no)
    assert_equal 0, var
    Account.deposit_money(amount)
    account = Account.acc_details.last
    assert_equal account.name, arr.last
    Account.delete
  end

  def test_to_deposit_money_with_invalid_details
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 2
    amount = -75
    Account.select_acc(acc_no)
    Account.deposit_money(amount)
    account = Account.acc_details.last
    assert_equal account.name, arr.last
    assert_equal account.acc_no, acc_no
    assert_equal account.balance, 0
    Account.delete
  end

  def test_to_withdraw_money
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 1
    amount = 0
    Account.select_acc(acc_no)
    Account.withdraw_money(amount)
    account = Account.acc_details.first
    assert_equal account.acc_no, acc_no
    assert_equal account.balance, 0
    Account.delete
  end
  
  def test_to_withdraw_money_with_invalid_acc_no
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = ""
    amount = 0
    var = Account.select_acc(acc_no)
    Account.withdraw_money(amount)
    account = Account.acc_details.first
    assert_equal 0, var
    assert_equal account.balance, 0
    Account.delete
  end
  
  def test_to_withdraw_money_with_incorrect_amount
    arr = ["xyz","abc"]
    arr.each do |ele|
      Account.create_acc(ele)
    end
    acc_no = 1
    amount = -75
    Account.select_acc(acc_no)
    Account.withdraw_money(amount)
    account = Account.acc_details.first
    assert_equal account.acc_no, acc_no
    assert_equal account.balance, 0
    Account.delete
  end

end 
