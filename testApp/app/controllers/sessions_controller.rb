class SessionsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def new
    
  end
  
  def create
    user = User.find_by(nickname: params[:nickname])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        log_in(user)
        format.html { redirect_to user}
        msg = { :status => "ok", :message => "Login success!"}
        format.json { render json: msg}
      else
        format.html { render :new , notice: "Invalid email/password combination"}
        msg = { :status => "error", :message => "Login failed!"}
        format.json { render json: msg}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Log out successful!"
  end
  
end
