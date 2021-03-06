class PhotosController < ApplicationController
  before_filter :load_photos_page

  def index
    @photo = current_user.photos.build if current_user.present?
  end

  def create
    @photo = current_user.photos.build(params[:photo])
    if @photo.save
      redirect_to root_url
    else
      render :index
    end
  end

  private

  def load_photos_page
    @photos = Photo.recent.page params[:page]
  end
end
