$: << File.dirname(File.expand_path(__FILE__))
require "bundler"
Bundler.require
require "app"

run App
