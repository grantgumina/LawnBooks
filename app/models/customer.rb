class Customer < ActiveRecord::Base
  # This shit is messing the app up
  # attr_accessor :password
  attr_accessible :first_name, :last_name, :address, :phone_number, :cell_number, :email, :password, :admin

  has_many :payments, :dependent => :destroy
  before_save :encrypt_password

  def has_password?(submitted_password)
    self.password == encrypt(submitted_password)
  end

  def encrypt_password
    self.password = encrypt(password)
  end

  def self.authenticate(email, submitted_password)
    customer = find_by_email(email)
    return nil if customer.nil?
    return customer if customer.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    customer = find_by_id(id)
    (customer && customer.salt == cookie_salt) ? customer : nil
  end
  
  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
