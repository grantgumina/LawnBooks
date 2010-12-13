# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101208005949) do

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuts", :force => true do |t|
    t.integer  "payment_id"
    t.date     "date_cut"
    t.string   "employee_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "amount_charged"
    t.integer  "amount_received"
    t.integer  "amount_due"
    t.date     "date_payed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["customer_id"], :name => "index_payments_on_customer_id"

end
