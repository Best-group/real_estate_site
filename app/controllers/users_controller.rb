class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    respond_to do |format|
      if @users.save
        format.html{ redirect_to user_url(@users), notice: "User #{@users.username} was successfully created."}
        format.json{ render action: 'show', status: :created, location: @users}
        @users.errors.full_messages
        flash[:notice] = 'You signed up successfully'
        flash[:color]= 'valid'
      else
        format.html {render action: 'new'}
        format.json{render json: @users.errors, status: :unprocessable_entity}
        @users.errors.full_messages
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
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
