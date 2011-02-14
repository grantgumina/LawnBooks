include SessionsHelper

class SessionsController < ApplicationController
  def new
    @title = 'Login'
  end

  def create
    customer = Customer.authenticate(params[:session][:email], params[:session][:password])
    if customer.nil?
      flash.now[:error] = 'Invalid email or password'
      @title = 'Login'
      render 'new'
      puts "ERROR"
    else
      sign_in customer
      redirect_to customer
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
