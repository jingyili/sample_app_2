class ClubsController < ApplicationController
  # To change this template use File | Settings | File Templates.
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  def index

  end

  def create
    @club = current_user.clubs.build(params[:club])
    if @club.save
      flash[:success] = "Club created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @club.destroy
    redirect_to root_url
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def correct_user
    @club = current_user.clubs.find_by_id(params[:id])
    redirect_to root_url if @club.nil?
  end
end