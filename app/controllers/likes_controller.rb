class LikesController < ApplicationController

  def create
    micropost=Micropost.find(params[:micropost_id])
     if Like.create(user_id:current_user.id, micropost_id:micropost.id)
      redirect_to micropost.user
    end
  end

  def destroy

  end
end
