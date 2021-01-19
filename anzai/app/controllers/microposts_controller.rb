# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost posted'
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referrer || root_url
  end

  def search
    @microposts = Micropost.searching(params[:search]).paginate(page: params[:page])
  end

  def reply
    @origin = Micropost.find(params[:micropost_id])
    @microposts = Micropost.replying(@origin.id)
    @micropost = Micropost.new
  end

  def make_reply
    @reply = current_user.microposts.build(reply_params)
    if @reply.save
      flash[:success] = 'Reply posted'
      redirect_to micropost_reply_path(Micropost.find(@reply.reply_to))
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def reply_params
    params.require(:reply).permit(:content, :picture, :reply_to)
  end
end
