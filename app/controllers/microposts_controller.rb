class MicropostsController < ApplicationController

  before_action :logged_in_user, only: [:create,:destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost posted"
      redirect_to root_url
    end
  else
    @feed_items = []
    render 'static_pages/home'
  end

  def destroy
    @micropost.destroy
    flash[:success] ="Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def search
    @microposts = Micropost.searching(params[:search])
  end

  def reply
    @micropost = Micropost.find(params[:micropost_id])
    @microposts = Micropost.replying(@micropost.id)
  end


  private

  def micropost_params
    params.require(:micropost).permit(:content,:picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id:params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def reply_params
    params.require(:reply).permit(:content,:picture,:reply_to)
  end

end
