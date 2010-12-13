class Cut < ActiveRecord::Base
  belongs_to :payment

  # validates :payment_id
  # validates :employee_name
end
