class PagesController < ApplicationController
  def home
    @images = Image.order(created_at: :desc).limit(30)
  end
end
