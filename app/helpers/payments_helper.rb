module PaymentsHelper
  def add_cut_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :cuts, :partial => 'cut', :object => Cut.new
    end
  end

  def fields_for_cut(cut, &block)
    prefix = cut.new_record? ? 'new' : 'existing'
    fields_for("payment[#{prefix}_cut_attributes][]", cut, &block)
  end
end
