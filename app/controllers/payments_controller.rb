include SessionsHelper

class PaymentsController < ApplicationController
  before_filter :authenticate
  # before_filter :correct_customer
  before_filter :check_for_admin, :only => [:create, :edit, :update, :destroy]

  # get /payments
  # get /payments.xml
  def index
    @payments = payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end

  # get /payments/1
  # get /payments/1.xml
  def show
    @payment = payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # get /payments/new
  # get /payments/new.xml
  def new
    @payment = payment.new
    @payment.cuts.build

#     respond_to do |format|
#       format.html # new.html.erb
#       format.xml  { render :xml => @payment }
#     end
  end

  # get /payments/1/edit
  def edit
    @payment = payment.find(params[:id])
  end

  # post /payments
  # post /payments.xml
  def create
    @payment = payment.new(params[:payment])
    
    if @payment.save 
      flash[:notice] = 'successfully save payment.'
      redirect_to @payment
    else
      flash[:notice] = 'sorry, but there was an error.'
      render :action => 'new'
    end
  end

  # put /payments/1
  # put /payments/1.xml
  def update
    params[:payment][:existing_cut_attributes] ||= {}
    @payment = payment.find(params[:id])
    
    if @payment.update_attributes(params[:payment])
      flash[:notice] = 'successfully updated payment.'
      redirect_to @payment
    else
      flash[:notice] = 'sorry, but there was an error.'
      render :action => 'edit'
    end
  end

  # delete /payments/1
  # delete /payments/1.xml
  def destroy
    @payment = payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end

  private
  def authenticate
    deny_access unless signed_in?
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to(root_path) unless current_customer?(@customer)
  end  

  def check_for_admin
    if signed_in?
    else
      redirect_to('/login')
    end
  end

end
