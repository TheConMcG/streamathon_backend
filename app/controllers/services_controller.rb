class ServicesController < ApplicationController

  def create
    service = Service.new(
      name: params[:name],
      region: params[:region],
      source_id: params[:source_id]
    )
  end

end