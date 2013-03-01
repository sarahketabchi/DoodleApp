class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

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
        format.json { render :json => @image.user_id }
      end
    else
      render :nothing => true, :status => 500
    end
  end

  def show
    @image = Image.find(params[:id])

    @user = current_user
    @contributed_users = @image.contributed_users.uniq {|user| user.id} 
    @favorited = @image.favorited?(current_user.id, @image.id)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to user_path(current_user)
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.img = params[:img];

    if @image.save!
      if current_user.id != @image.user_id
        Contributor.create!(:user_id => current_user.id, :image_id => @image.id)
      end

      respond_to do |format|
        format.json { render :json => current_user.id }
      end
    else
      render :nothing => true, :status => 500
    end
  end
end
