class ChoicesController < ApplicationController

  def index
    i = 0
    source_array = []
    choice_data = []
    urls = []
    while i < current_user.service_users.length
      source_id = Service.find(current_user.service_users[i].service_id).source_id
      i += 1
      source_array << source_id
    end
    source_ids = source_array.join(",")
    page = rand((1...20))
    response = HTTP.get("https://api.watchmode.com/v1/list-titles/?apiKey=#{Rails.application.credentials.watchmode_api_key}&source_ids=#{source_ids}&genres=comedy&page=#{page}&limit=3").parse(:json)
    response['titles'].each do |choice|
      tmdb_type = choice['tmdb_type']
      tmdb_id = choice['tmdb_id']
      title_id = choice['id']
      k = 0
      photo_response = [ HTTP.get("https://api.themoviedb.org/3/#{tmdb_type}/#{tmdb_id}?api_key=#{Rails.application.credentials.tmdb_api_key}").parse(:json) ]
      url_response = HTTP.get("https://api.watchmode.com/v1/title/#{title_id}/sources/?apiKey=#{Rails.application.credentials.watchmode_api_key}").parse(:json)
      url_response.each do |link|
        j = 0
        while j < source_array.length
          if link['source_id'] == source_array[j] && link['region'] == "US" && link['type'] == "sub"
            urls << link
          end
          j += 1
        end
        photo_response[k].merge! :urls => urls
      end
      choice_data << photo_response
      urls = []
      k += 1
    end
    render json: choice_data
  end

end
