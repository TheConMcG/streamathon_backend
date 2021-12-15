class UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      if user && user.authenticate(params[:password])
        jwt = JWT.encode(
          {
            user_id: user.id, # the data to encode
            exp: 24.hours.from_now.to_i # the expiration time
          },
          Rails.application.credentials.fetch(:secret_key_base), # the secret key
          "HS256" # the encryption algorithm
        )
        render json: { message: "User created successfully", jwt: jwt, email: user.email, user_id: user.id }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

end

