$: << File.dirname(File.expand_path(__FILE__))
require "bundler"
Bundler.setup
require "sinatra/base"
require "sass"
require "coffee_script"
require "sprockets"
require "app/asset_helpers"

module App
  class Base < Sinatra::Base

    set :root, File.expand_path('../../', __FILE__)
    set :sprockets, ::Sprockets::Environment.new(root)

    configure do
      enable :logging
      set :server, :puma
      AssetHelpers.configure! sprockets, root
    end

    configure :production do
      sprockets.js_compressor = :uglifier
      sprockets.css_compressor = :sass
    end

    configure :development do
      require "sinatra/reloader"
      require "better_errors"
      register Sinatra::Reloader
      use BetterErrors::Middleware
      BetterErrors.application_root = File.expand_path("..", __FILE__)
    end

    helpers do
      include App::AssetHelpers
    end

    get "/" do
      erb :index
    end

    get "/error" do
      raise
    end
  end
end
