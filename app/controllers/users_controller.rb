class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.new(params_user)
        if @user.save
            flash[:notice] = "you have successfully signed up! #{@user.user_name}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id]) 
        if @user.update(params_user)
            flash[:notice] = "Update successfully "
            redirect_to articles_path
        else 
            render 'edit' 
        end
    end


    private
    def  params_user
        params.require(:user).permit(:user_name, :email, :password)
    end
end