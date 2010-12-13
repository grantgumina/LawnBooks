class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :customer_id
      t.integer :amount_charged
      t.integer :amount_received
      t.integer :amount_due
      t.date    :date_payed

      t.timestamps
    end
    add_index :payments, :customer_id
  end

  def self.down
    drop_table :payments
  end
end
