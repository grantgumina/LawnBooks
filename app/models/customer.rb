class Customer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address, :phone_number, :cell_number, :email, :hashed_password, :admin
  attr_protected :id, :salt
  attr_accessor :password

  has_many :payments, :dependent => :destroy



  def self.authenticate(login, password)
    customer = find(:conditions => ["login = ?", login]
    return nil if customer.nil?
    return customer if Customer.encrypt(password, customer.salt)==customer.hashed_password
    nil
  end
  
  def password=(pass)
    @password = pass
    self.salt = Customer.random_string(10) if !self.salt?
    self.hashed_password = Customer.encrypt(pass, self.salt)
  end

  protected
    def encrypt(pass, salt)
      Digest::SHA2.hexdigest(pass+salt)
    end

    def self.random_string(len)
      #generat a random password consisting of strings and digits
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      newpass = ""
      1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
      return newpass
    end
end
