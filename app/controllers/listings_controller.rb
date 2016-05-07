class ListingsController < ApplicationController
  #forcing devise authentication
  #before_action :authenticate_user!

  #creating a new listing object
  def new
    @listings = Listing.new
  end

  #method add listing object to database
  def create
    @listings = Listing.new(listing_params)
    respond_to do |format|
      if @listings.save
        format.html{ redirect_to @listings, notice: "Listing #{@listings.title} was successfully created."}
        format.json{ render action: 'display', status: :created, location: @listings}
        @listings.errors.full_messages
        flash[:notice] = 'You listed successfully'
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

  end

  #display the result of listing addition
  def show
    @listings = Listing.find(params[:id])
  end

  def display

  end



  protected
  #using strong parameters
  def listing_params
    params.require(:listing).permit(:title, :suburbID, :street, :unit, :price, :bedroom, :bathroom, :carports, :land_size, :description, :typeID, :userID, :listingsID)
  end
end
