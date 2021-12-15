class UrlsController < ApplicationController

  def show
    # title_id = params[:id]
    title_id = 345534
    response = HTTP.get("https://api.watchmode.com/v1/title/#{title_id}/sources/?apiKey=#{Rails.application.credentials.watchmode_api_key}")
    render json: response.parse(:json)
  end

end
