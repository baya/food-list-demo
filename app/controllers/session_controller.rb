class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user
      self.current_user = user
      flash[:notice] = I18n.t('site.login_successful')
      redirect_to '/food_plan'
    else
      flash[:notice] = I18n.t('site.login_failed')
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = I18n.t('site.logout_successfully')
    redirect_to '/'
  end

  def set_language
    check_avaliable_languages(params[:language])
    refer = request.env["HTTP_REFERER"]
    session[:current_language] = params[:language].to_sym

    redirect_to refer
  end

  private

  def check_avaliable_languages(lang)
    if !SiteLocale.avaliable_locales.include?(lang.to_s)
      msg = "invalid language #{lang}"
      raise SiteLocale::InvalidLanguages.new(msg)
    end
  end
  
end
