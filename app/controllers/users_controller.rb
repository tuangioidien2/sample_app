class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def show
        @user = User.find_by id: params[:id]
        return if @user
        flash[:warning] = "Not found user!"
        redirect_to root_path 
    end
    def create
        @user = User.new user_params # Not the final implementation!
        if @user.save
        # Handle a successful save.
        flash[:success] = "User create successful"
        redirect_to @user
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit :name, :email, :password, :password_confirmation
    end
end