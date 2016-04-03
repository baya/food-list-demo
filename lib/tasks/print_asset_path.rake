task :print_asset_path => [:environment] do
  puts Rails.application.config.assets.paths.join("\n")
end
