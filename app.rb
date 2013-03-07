require "bundler"
Bundler.require
require "sinatra/reloader" if development?
require "better_errors"

class App < Sinatra::Base

  configure :development, :production do
    enable :logging
    set :server, :puma
  end

  configure :development do
    register Sinatra::Reloader
    use BetterErrors::Middleware
    BetterErrors.application_root = File.expand_path("..", __FILE__)
  end

  get "/" do
    "Hello World"
  end

  get "/error" do
    raise
  end
end
