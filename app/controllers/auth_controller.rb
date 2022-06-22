class AuthController < ApplicationController

  def auth
    user = User.find_by_first_name(params[:first_name])
    if user
      render json: AnyCable::Rails::JWT.encode(current_user: user), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity  
    end
  end
end
