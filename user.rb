class User 
  @@user_info=[]

  def initialize(name,address,phone_no)
    @name = name
    @address = address
    @phone_no = phone_no
  end

  def self.create_user
    name = "Apeksha singh"
    address = "delhi"
    phone_no = 7891248427
    user_obj = User.new(name,address,phone_no)
    @@user_info << user_obj
    Account.get_user_details << user_obj
  end
  
  def self.print_info
    puts @@user_info.inspect
  end

end
