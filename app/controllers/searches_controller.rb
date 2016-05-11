class SearchesController < ApplicationController


  def create
  end

  def destroy
  end

  def edit
  end

  #Create a listing of feature properties
  def index
    @listings = Listing.order('created_at DESC').limit(5)
  end

  def new
  end

  #show the result of solr query
  def show
    @listings = Listing.search do
      keywords params[:query]
    end.results

    respond_to do |format|
      format.html { render :action => "show" }
      format.xml  { render :xml => @listings }
    end
  end

  def update
  end

  #method to search listings
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
