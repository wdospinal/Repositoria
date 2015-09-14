class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      #flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :nickname, :password,
                                   :password_confirmation)
    end
  
end
