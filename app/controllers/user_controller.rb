class UserController < ApplicationController
  def new
<<<<<<< HEAD
  end

  def create
=======
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
>>>>>>> Basic_project
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
<<<<<<< HEAD
  end

  def show
=======
    @user = User.all
  end

  def show
    @user = User.where(params[:username])
>>>>>>> Basic_project
  end
end
