class Payment < ActiveRecord::Base
  belongs_to :customer
  has_many :cuts, :dependent => :destroy
  
  validates :amount_charged, :presence => true
  validates :amount_received, :presence => true
  validates :amount_due, :presence => true
  validates :date_payed, :presence => true

  def cut_attributes=(cut_attributes)
    cut_attributes.each do |attributes|
      cuts.build(attributes)
    end
  end

end
