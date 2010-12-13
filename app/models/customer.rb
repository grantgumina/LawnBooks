class Customer < ActiveRecord::Base
  has_many :payments, :dependent => :destroy
end
