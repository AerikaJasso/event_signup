class SessionsController < ApplicationController
	
  def new

  end

  def create
  	@user = User.find_by_email(login[:email])
  	if @user && @user.authenticate(login[:password])
  		session[:user_id] = @user.id 
  		redirect_to "/events"
  	else
  		redirect_to "/sessions/new", flash: { danger: "Invalid Credentials"}
  	end
  end

  def destroy
  	reset_session
  	redirect_to "/sessions/new"
  end

  private

  def login
  	params.require(:user).permit(:email, :password)
  end
end
