class ServiceUsersController < ApplicationController

  def create
    service_ids = params[:service_ids]
    i = 0
    while i < service_ids.length
      service = Service.find_by(source_id: params[:service_ids][i])
      service_users = ServiceUsers.new(
        service_id: service.id,
        user_id: current_user.id
      )
      service_users.save!
      i += 1
    end
    render json: service_users
    # if service_user.save
    #   render json: service_user
    # else
    #   render json: { errors:service_user.errors.full_message }, status: :bad_request
    # end
  end

end
