class FriendshipsController < ApplicationController
  # Para poder probar peticiones
  skip_before_action :verify_authenticity_token
  
  def new
    @friendship = Friendship.new
  end
  
  def create
    friend = User.find_by nickname: params[:nickname]
    respond_to do |format|
      if !friend.nil?        
        @friendship = current_user.friendships.build(:friend_id => friend.id)
        if @friendship.save
          # Notificación agregaste amigo.
          msg = { :status => "ok", :message => "Friend added successfully!"}
          format.json { render json: msg}
          format.html { redirect_to current_user }
        else
          # Notificación No se pudo agregar.
          msg = { :status => "error", :message => "Server error"}
          format.json { render json: msg}
          format.html { redirect_to current_user }
        end     
         
      else
        msg = { :status => "error", :message => "Friend not found!"}
        format.json { render json: msg}
        format.html { redirect_to current_user, notice: 'Friend not found!'}
      end
    end
    
  end
  
  def show
    if logged_in?
      @friends = Friendship.where("user_id = %s", current_user.id)
      @friends = User.find(@friends.map(&:friend_id))
    else
      redirect_to login_path
    end
    
  end

end
