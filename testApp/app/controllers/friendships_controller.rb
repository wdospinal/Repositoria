class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end
  
  def create
    friend = User.find_by nickname: params[:nickname]
    @friendship = current_user.friendships.build(:friend_id => friend.id)
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to current_user
    else
      flash[:error] = "Unable to add friend."
      redirect_to current_user
    end
  end

end
