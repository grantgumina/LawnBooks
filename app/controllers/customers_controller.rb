include SessionsHelper

class CustomersController < ApplicationController
  # before_filter :authenticate
  # before_filter :correct_customer
  # before_filter :check_for_admin, :only => [:edit, :update, :destroy]
  
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    @title = "Edit user"
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.authenticate(params[:session][:email], params[:session][:password])
    if @customer.is_admin?
    else
      sign_in @customer
      redirect_back_or @customer
    end

    respond_to do |format|
      if @customer.save
        format.html { redirect_to(@customer, :notice => 'Customer was successfully created.') }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
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
