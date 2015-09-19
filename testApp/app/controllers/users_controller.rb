class UsersController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors }
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
     
  private
    def user_params
      params.require(:user).permit(:name, :nickname, :password,
                                   :password_confirmation)
    end
  
end
