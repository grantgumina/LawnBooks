class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.xml
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.xml
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.xml
  def new
    @payment = Payment.new
    @payment.cuts.build
# 
#     respond_to do |format|
#       format.html # new.html.erb
#       format.xml  { render :xml => @payment }
#     end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.xml
  def create
    @payment = Payment.new(params[:payment])
    
    if @payment.save 
      flash[:notice] = 'Successfully save payment.'
      redirect_to @payment
    else
      flash[:notice] = 'Sorry, but there was an error.'
      render :action => 'new'
    end
  end

  # PUT /payments/1
  # PUT /payments/1.xml
  def update
    params[:payment][:existing_cut_attributes] ||= {}
    @payment = Payment.find(params[:id])
    
    if @payment.update_attributes(params[:payment])
      flash[:notice] = 'Successfully updated payment.'
      redirect_to @payment
    else
      flash[:notice] = 'Sorry, but there was an error.'
      render :action => 'edit'
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.xml
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end
end
