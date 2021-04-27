class UsersController < ApplicationController
    def index
        @user = User.all
        print @user
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
        else
            puts "User data not good"
        end
        redirect_to users_path
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)

        redirect_to user_path(user)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy

        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email , :phone)
    end

end
