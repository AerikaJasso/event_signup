class UsersController < ApplicationController
  def new
  end

  def index
  	@user = User.find(params[:id])
  end

  def create 
  	user = User.new user_params
  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/events"
  	else
  		redirect_to "/sessions/new", flash: {danger: user.errors.full_messages.join(",")}
  	end
  end

  def edit
  	@user = current_user
  end

  def update
  	user = current_user
  	if user.update update_user_params
  		redirect_to edit_user_path(user), flash: {success: "Successfully Updated!"}
  	else
  		redirect_to edit_user_path(user), flash: {danger: user.errors.full_messages }
  	end
  end

  def destroy
  end

  private

  def update_user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :city, :state )
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
