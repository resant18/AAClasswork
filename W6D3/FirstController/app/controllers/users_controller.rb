class UsersController < ApplicationController
  def index
    #render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    # render json: params
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    render json: params
  end
end