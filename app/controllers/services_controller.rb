class ServicesController < ApplicationController

  def create
    service = Service.new(
      name: params[:name],
      region: params[:region],
      source_id: params[:source_id]
    )
    service.save
    if service.save
      render json: service
    else
      render json: { errors: service.errors.full_message }, status: :bad_request
    end
  end

end