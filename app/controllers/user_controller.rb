class UserController < ApplicationController
  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
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
    @user = User.all
  end

  def show
    @user = User.where(params[:username])
  end
end
