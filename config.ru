$: << File.dirname(File.expand_path(__FILE__))
require "lib/app"

map '/assets' do
  puts "assets"
  run App::Base.sprockets
end

map '/' do
  run App::Base
end
