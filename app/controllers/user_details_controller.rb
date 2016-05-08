class UserDetailsController < ApplicationController
  def create
	
	@user_detail = UserDetail.new(user_params)
	
	if @user_detail.save
		puts "succse"
	else
		puts "fail"
		end 
		
  end
  

  def destroy
  end

  def edit
  
  end

  def index
  end

  def new
	@user_detail = UserDetail.new
  end

  def show
	#@user_details = user_details.find(params[id])
  end

  def update
  end
 
 private 
 
  def user_params
  
	params.require(:user_detail).permit(:name)
end
end