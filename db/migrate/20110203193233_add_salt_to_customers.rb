require 'digest'
class AddSaltToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :salt, :string
  end

  def self.down
    remove_column :customers, :salt
  end
end
