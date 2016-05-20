class ListingsController < ApplicationController
  #forcing devise authentication
  #before_action :authenticate_user!

  #creating a new listing object
  def new
    @listings = Listing.new
    #3.times {@listings.images.build} # added this
    @images = @listings.images.build(:listing_id => @listings.id)
end

  #method add listing object to database
  def create
    @listings = Listing.new(listing_params)

    respond_to do |format|

      if @listings.save
        save_images if params[:listing][:images]

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
   @listings = Listing.find(params[:id])
    if @listings.update_attributes(listing_params)
      redirect_to :action => 'show', :id => @listings
    end
  end

  def edit
    @listings = Listing.find(params[:id])
  end

  def destroy
    @listings = Listing.find(params[:id])
    @listings.destroy

    redirect_to :action => 'index'

   #respond_to do |format|
   #   format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
   #   format.json { head :no_content }
   #   format.js   { render :layout => false }
   #end
  end

  def index
    @listings = Listing.order('created_at DESC')
  end

  #display the result of listing addition
  def show
    @listings = Listing.find(params[:id])
    #@listings = @listings.images.all
  end

  def display

  end

  def new
    @listings = Listing.new
  end


  protected
  #using strong parameters
  def listing_params
    params.require(:listing).permit(:title, :suburbID, :street, :unit, :price, :bedroom, :bathroom, :carports, :land_size, :description, :typeID, :userID, :images_attributes=>[:id, :listing_id, :image_link])
  end

  private
  def save_images
    params[:listing_images]['image_link'].each do |img|
      @images = @listings.images.create!(:image_link => img)
    end
  end

end
