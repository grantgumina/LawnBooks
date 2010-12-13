class CutsController < ApplicationController
  def index
    @cuts = Cut.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @cuts }
    end
  end

  def show
    @cut = Cut.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @cut }
    end
  end

  def new
    @cut = Cut.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @cut }
    end
  end

  def edit
    @cut = Cut.find(params[:id])
  end

  def create
    @cut = Cut.new(params[:cut])

    respond_to do |format|
      if @cut.save
        format.html { redirect_to(@cut, :notice => 'Saved' )}
        format.xml  { render :xml => @cut, :status => :created, :location => @cut }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @cut.errors, :status => :unprocessable_entity }
      end
    end

  def update
    @cut = Cut.find(params[:id])

    respond_to do |format|
      if @cut.update_attributes(params[:payment])
        format.html { redirect_to(@cut, :notice => 'Cut was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cut.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cuts/1
  # DELETE /cuts/1.xml
  def destroy
    @cut = Cut.find(params[:id])
    @cut.destroy

    respond_to do |format|
      format.html { redirect_to(cuts_url) }
      format.xml  { head :ok }
    end
  end
end
