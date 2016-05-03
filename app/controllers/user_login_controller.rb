class UserLoginController < ApplicationController
  def new
    if logged_in?
    redirect_to current_user, alert: "Already logged in as #{current_user.username}"
    else
    end
  end
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end