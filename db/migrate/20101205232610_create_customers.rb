class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :cell_number
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end