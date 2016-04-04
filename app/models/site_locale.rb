class SiteLocale

  class InvalidLanguages < StandardError; end

  def self.avaliable_locales
    [
     'zh-CN',
     'en'
    ]
  end
  
end
