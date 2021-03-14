class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        if @user.save
            flash[:notice] = "Welcome to the alpha blog #{@user.name} you have successfully signed up"         
        else
            render "new"
        end
    end

    private

    def users_params
        params.require(:user).permit(:name, :email, :password)
    end
end
