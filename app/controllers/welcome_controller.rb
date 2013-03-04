class WelcomeController < ApplicationController
  def index
    @images = Image.all
    @top_image = Image.select("images.*, COUNT(*) AS favs_count")
                      .joins(:favorites)
                      .group("images.id")
                      .order("favs_count DESC")
                      .first
  end
end

