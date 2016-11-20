class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login_required
    redirect_to root_path unless login?
    @current_user = User.new(session[:user])
  end

  helper_method :current_user

  private

  def login?
    user = session[:user].try(:[], 'email')
    return false if user.nil?
    user != 'null'
  end

  def current_user
    @current_user ||= User.new(session[:user]) if login?
  end
end
