class AddAdminToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :customers, :admin
  end
end
