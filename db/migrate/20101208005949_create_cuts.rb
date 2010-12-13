class CreateCuts < ActiveRecord::Migration
  def self.up
    create_table :cuts do |t|
      t.integer :payment_id
      t.date    :date_cut
      t.string  :employee_name
      t.timestamps
    end
  end

  def self.down
    drop_table :cuts
  end
end
