class ImagesController < ApplicationController
  before_filter :authenticate_user!
  include ImagesHelper

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new;
    @image.user_id = current_user.id;
    @image.img = params[:img];

    if @image.save!
      respond_to do |format|
        # REV: does this send down the whole image on save? That could
        # be a bunch of data the user already has.
        format.json { render :json => @image }
      end
      # redirect_to root_path
    else
      render :nothing => true, :status => 500
    end
  end

  def show
    @image = Image.find(params[:id])

    @user = current_user
    @favorited = favorited?(current_user.id, @image.id)
  end
end
