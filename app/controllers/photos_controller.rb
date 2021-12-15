class PhotosController < ApplicationController

  def index
    tmdb_type = params[:tmdb_type]
    tmdb_id = params[:id]
    response = HTTP.get("https://api.themoviedb.org/3/#{tmdb_type}/#{tmdb_id}?api_key=#{Rails.application.credentials.tmdb_api_key}")
    render json: response.parse(:json)
  end

end

