module SessionsHelper
  def sign_in(customer)
    cookies.permanent.signed[:remember_token] = [customer.id, customer.password]
    self.current_customer = customer
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_customer = nil
  end

  def signed_in? 
    # returns false if current_customer is nil
    !current_customer.nil?
  end

  def current_customer=(customer)
    @current_customer = customer
    # @current_customer ||= customer_from_remember_token
  end

  def current_customer 
  #   @current_customer ||= customer_from_remember_token
  end

  def current_customer?(customer)
    # customer == current_customer
    customer = current_customer
  end

  private
  # def customer_from_remember_token
  #   Customer.authenticate_with_salt(*remember_token)
  # end

  # def remember_token
  #   cookies.signed[:remember_token] || [nil, nil]
  # end

  def deny_access
    store_location
    redirect_to "/login"
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
