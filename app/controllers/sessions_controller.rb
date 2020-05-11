class SessionsController < ApplicationController
  def new; end
  
  def create
    @user = User.find_by(name: params[:session][:name])
    if user
      log_in user
    else
      flash[:danger] = 'Logged in'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
