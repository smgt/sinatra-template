module App
  module AssetHelpers
    def asset_path(source)
      "/assets/" + settings.sprockets.find_asset(source).digest_path
    end

    def self.configure!(sprockets, root)
      %w{ stylesheets javascripts images }.each do |thing|
        puts "Configuring #{thing}"
        sprockets.append_path(File.join(root, 'assets', thing))
      end
      sprockets.context_class.instance_eval do
        include App::AssetHelpers
      end
      puts sprockets.inspect
    end
  end
end
