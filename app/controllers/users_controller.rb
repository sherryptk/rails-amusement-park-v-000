class UsersController < ApplicationController

  def new
  end

  def index
  end

  def create
    if User.find_by(:name => params[:user][:name])
      @user = User.find_by(:name => params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to(@user)
      end
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to(@user)
     end
  end

  def signin
  end

  def show
    if session[:user_id] == current_user.id
      @user = User.find(params[:id])
      @message = params[:message]
    else
      redirect_to(root_path)
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def current_user
    User.find(params[:id])
  end

end
