class UsersController < ApplicationController

    before_action :require_user, only:[:edit, :update]
    before_action :require_same_user, only:[:edit, :update]
     
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end

    def create 
        @user = User.new(params_user)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "you have successfully signed up! #{@user.user_name}"
            redirect_to users_path
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
            redirect_to @user
        else 
            render 'edit' 
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session[user_id] = nil  if @user == current_user
        flash[:notice] = "Account and your assosiate articles are deleted"
        redirect_to articles_path
    end
    
    private
    def  params_user
        params.require(:user).permit(:user_name, :email, :password)
    end

    def require_same_user
        if current_user = @user && !current_user.admin?
            flash[:alert] = "you can Edit or Delete only own Account"
            redirect_to @user
        end 
    end
end