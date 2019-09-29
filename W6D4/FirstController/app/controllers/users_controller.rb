class UsersController < ApplicationController
  def index
    #what did one ocean say to the other ocean? nothing they just waved. tu dun tsk!
    #carlos wasnt here. queue fade out music*
    users = {}
    if params[:query]
      users = User.all.where("username LIKE ?", "%#{params[:query]}%")
    else
      users = User.all
    end
    render json: users 
    #have to either render or redirect 
    #cannot do both 
  end

  def show

    user = User.find(params[:id])
    render json: user
  end

  def create 
    user = User.new(user_params)

    if user.save #attempt to save user to the database. .save returns a boolean that says whether the user was saved or not 
      render json:user
    else
      render json:user.errors.full_messages, status: 422 #errors object gets stored on the user
    end

  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json:user
    else
      render json:user.errors.full_messages, status: 422 #errors object gets stored on the user
    end

  end

  def destroy
    user = User.find(params[:id]) #creates a variable that will always live within scope of method

    user.destroy #destroy user in the database 
    render json:user
  end

  private
  
  def user_params
    params.require(:user).permit(:username)
  end
end