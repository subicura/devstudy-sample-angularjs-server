class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:create, :update]
  
  def index
    render :json => Community.all
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      render :json => @community
    else
      render :json => nil
    end
  end

  def update
    if @community.update(community_params)
      render :json => @community
    else
      render :json => nil
    end
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name)
  end
end
