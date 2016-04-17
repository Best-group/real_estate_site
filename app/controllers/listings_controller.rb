class ListingsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @listings = Listing.order('created_at DESC').limit(5)
  end

  def show
    @listings = Listing.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @listings }
    end
  end

  def search
    @listings = Listing.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @listings }
    end
  end
end
