class UsersController < ApplicationController
    before_action :initialize_user, only: [:edit, :update, :show, :destory]

    def show
        
    end

    def new
        @user = User.new
    end

    def index
        @users = User.all;
    end

    def edit

    end

    def create
        @user = User.new(users_params)
        if @user.save
            flash[:notice] = "Welcome to the alpha blog #{@user.name} you have successfully signed up"
            redirect_to articles_path         
        else
            render "new"
        end
    end

    def update
        if @user.update(users_params)
            flash[:notice] = "The user #{@user.name} was updated successfully"
            redirect_to articles_path        
        else
            render "edit"
        end    
    end

    private

    def initialize_user
        @user = User.find(params[:id])
    end

    def users_params
        params.require(:user).permit(:name, :email, :password)
    end
end
