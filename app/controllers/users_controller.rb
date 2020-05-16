class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created'
      log_in @user
      remember @user
      redirect_to root_path
    else
      flash[:danger] = 'Error creating user'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
