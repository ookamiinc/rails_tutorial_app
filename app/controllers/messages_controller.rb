class MessagesController < ApplicationController
  def index
    @message = Message.new
    @user = User.find(params[:id])
    @messages = Message.dm(current_user.id,@user.id)
  end

  def create
    user = User.find(params[:id])
    message = current_user.sending.build(user_id:user.id)
    if message.save
      redirect_to dm_user_url(user,other_user:current_user.id)
    end
  end

end
