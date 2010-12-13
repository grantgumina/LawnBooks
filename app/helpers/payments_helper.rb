module PaymentsHelper
  def add_cut_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :cuts, :partial => 'cut', :object => Cut.new
    end
  end
end
