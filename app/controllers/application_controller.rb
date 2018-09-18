class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  before_action :init_i18n

  protected

  def authorize
    redirect_to login_url, notice: "Log in required!" unless User.find_by(id: session[:user_id])
  end

  def init_i18n
    return unless params[:locale]
    if I18n.available_locales.map(&:to_s).include?(params[:locale])
      I18n.locale = params[:locale]
    else
      flash.now[:notice] =
        "#{params[:locale]} translation not available"
      logger.error flash.now[:notice]
    end
  end
end
