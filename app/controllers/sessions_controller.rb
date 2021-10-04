class SessionsController < ApplicationController

  def new
  end

  def create 
    user = User.find_by(email:params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "User login successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was somethigs wrong with your details"
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out Successfully"
    redirect_to root_path
  end

end
