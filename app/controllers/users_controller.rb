class UsersController < ApplicationController
    before_action :initialize_user, only: [:edit, :update, :show, :destory]
    before_action :require_user, except: [:show, :index]

    def show
        
    end

    def new
        @user = User.new
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5);
    end

    def edit
    end

    def create
        @user = User.new(users_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the alpha blog #{@user.name} you have successfully signed up"
            redirect_to @user        
        else
            render "new"
        end
    end

    def update
        if @user.update(users_params)
            flash[:notice] = "The user #{@user.name} was updated successfully"
            redirect_to @user        
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

    def require_same_user
        if !current_user == @user
            flash[:notice] = "You may only edit or delete your own user"
        end
    end
end
