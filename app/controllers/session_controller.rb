class SessionController < ApplicationController

  def new
  end

  def create
  end

  def destroy
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
