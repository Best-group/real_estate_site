class ListingsController < ApplicationController
  def new
    @listings = Listing.new
  end

  def create
    @listings = Listing.new(listing_params)
    respond_to do |format|
      if @listings.save
        format.html{ redirect_to @listings, notice: "User #{@listings.title} was successfully created."}
        format.json{ render action: 'display', status: :created, location: @listings}
        @listings.errors.full_messages
        flash[:notice] = 'You signed up successfully'
        flash[:color]= 'valid'
      else
        format.html {render action: 'new'}
        format.json{render json: @listings.errors, status: :unprocessable_entity}
        @listings.errors.full_messages
        flash[:notice] = 'Form is invalid'
        flash[:color]= 'invalid'
        #render 'new'
      end
    end

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

  def display
    @listings = Listing.find(params[:id])
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

  protected

  def listing_params
    params.require(:listing).permit(:title, :suburbID, :street, :unit, :price, :bedroom, :bathroom, :carports, :land_size, :description, :typeID, :userID)
  end
end
