module SessionsHelper
  def log_in
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    if (user_id == session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id == cookies.signed[:user_id])
      @current_user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(_user)
    cookies.delete(:user_id)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
