class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def authorize
    redirect_to login_url, notice: "Log in required!" unless User.find_by(id: session[:user_id])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
