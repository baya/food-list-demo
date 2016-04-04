task :load_locales => [:environment] do
  locale_files = Rails.root.join('config/locales', '*.yml')
  Dir.glob(locale_files).each {|f|
    locale = File.basename(f, '.yml')
    data = YAML.load_file(f)[locale]
    puts locale
    I18n.backend.store_translations(locale, data, :escape => false)
  }
end
