class UserController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render 'new'
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
    @users = User.find(params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

end
