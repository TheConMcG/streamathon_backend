class SourcesController < ApplicationController

  def index
    i = 0
    source_ids = []
    while i < current_user.service_users.length
      source_id = Service.find(current_user.service_users[i].service_id).source_id
      i += 1
      source_ids << source_id
    end
    render json: source_ids
  end

end
