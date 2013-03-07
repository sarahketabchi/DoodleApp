class WelcomeController < ApplicationController
  def index
    #@images = Image.all
    if (current_user == nil)
      @images = Image.where(:privacy => 'public')
    else
      @images = Image.all_viewable_by(current_user)
    end

    @top_image = Image.select("images.*, COUNT(*) AS favs_count")
                      .joins(:favorites)
                      .group("images.id")
                      .order("favs_count DESC")
                      .first
  end
end

