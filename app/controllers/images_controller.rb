class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new;
    @image.user_id = params[:user_id];
    @image.img = params[:img];

    if @image.save!
      respond_to do |format|
        format.json { render :json => @image }
      end
      # redirect_to root_path
    else
      render :nothing => true, :status => 500
    end
  end

  def show
    @image = Image.find(params[:id])
  end
end
