class UsersController < ApplicationController
    def new
        @user = User.new 
        render :new
    end

    #sign up
    def create
        @user = User.new(user_params)

        if @user.save 
            redirect_to posts_url
        else  
            flash[:erros] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
