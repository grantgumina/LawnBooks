class Payment < ActiveRecord::Base
  belongs_to :customer
  has_many :cuts, :dependent => :destroy
  
  after_update :save_cuts
  
  validates :amount_charged, :presence => true
  validates :amount_received, :presence => true
  validates :amount_due, :presence => true
  validates :date_payed, :presence => true

  def new_cut_attributes=(cut_attributes)
    cut_attributes.each do |attributes|
      cuts.build(attributes)
    end
  end

  def existing_cut_attributes=(cut_attributes)
    cuts.reject(&:new_record?).each do |cut|
      attributes = cut_attributes[cut.id.to_s]
      if attributes
        cut.attributes = attributes
      else
        cuts.delete(cut)
      end
    end
  end

  def save_cuts
    cuts.each do |cut|
      cut.save(false)
    end
  end
end
