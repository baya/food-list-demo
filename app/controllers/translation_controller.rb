class TranslationController < ApplicationController

  before_filter :auth_translator_role

  def edit
    @key = params[:key]
    @locales = ['zh-CN', 'en']
    render layout: false
  end

  def update
    key = params[:key]
    params[:trans_content].each {|locale, value|
      data = {key => ActiveSupport::JSON.decode(value)}
      if data[key].present?
        I18n.backend.store_translations(locale, data, escape: false)
      end
    }
    refer = request.env["HTTP_REFERER"]
    redirect_to refer
  end

  private

  def auth_translator_role
    if current_user && current_user.translator?
    else
      render status: 403, text: I18n.t('forbiden')
    end
  end
  
end
