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
            render :new

        end
    end


    private
    def  params_user
        params.require(:user).permit(:user_nmae, :email, :password)
    end
end