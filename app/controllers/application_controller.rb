class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_lang

  helper_method :current_user


  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def set_current_lang
    if session[:current_language].present?
      I18n.locale = session[:current_language].to_sym
    end
  end

  def current_lang
    @current_lang ||= session[:current_language].to_sym
  end
  
end
