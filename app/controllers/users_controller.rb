class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  before_filter :authenticate_user!, :except => [:new, :create]
  #load_and_authorize_resource

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
    @users = User.find(params[:id])
    authorize @users
    puts 'end'
  end

  def destroy
    @users = User.find(current_user.id)
    @users.is_active = 0
    if @users.save
      sign_out @user
      redirect_to root_path
    else
      render "edit"
    end
  end

  def index
    @users = User.all
  end

  def show
    #@users = User.find(params[:confirmation_token])

    @users = User.find(params[:id])
    #authorize! :show, @users
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def new_params
    params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  end

end
