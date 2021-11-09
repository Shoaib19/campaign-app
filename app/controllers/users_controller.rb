class UsersController < ApplicationController
before_action :get_user, only:[:show,:edit,:update,:destroy]
    def index
        @users = User.all
    end

    def new
        @user = User.create
    end

    def create
        @user = User.new(user_params)
        if @user.after_save
            redirect_to @user
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end
    
    def destroy
        @user.destroy
        redirect_to users_path
    end
    
    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    

private

    def get_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email,:password, :username, :status, :profession, :service, :user_type)
    end

end
