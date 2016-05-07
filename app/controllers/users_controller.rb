class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  #before_filter :authenticate_user!, :except => [:new, :create]

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    respond_to do |format|
      if @users.save
        format.html{ redirect_to user_url(@users), notice: "User #{@users.username} was successfully created."}
        format.json{ render action: users_show_url, status: :created, location: @users}
        UserMailer.welcomeUser(@users).deliver
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
    @users = current_user
    #@users = User.find_by(params[:id])
    if @users.update_with_password(new_params)
      flash[:notice] = :updated
      sign_in @users, :bypass => true
      respond_to do |format|
        format.html{redirect_to user_url(@users), notice: "User #{@users.username} was successfully changed."}
      end

    else
      render 'edit'
    end
  end

  def edit
    @users = current_user
  end

  def destroy
  end

  def index
    @users = User.all
  end

  def show
    @users = User.find_by(params[:confirmation_token])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def new_params
    params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  end

end
