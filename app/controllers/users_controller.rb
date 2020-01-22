class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "You've successfully registered!"
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash[:alert] = "There was a problem registering."
            redirect_to '/register'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :profile_picture, :password, :password_confirmation)
    end
end
