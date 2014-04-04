require 'cordova'
require 'uglifier'

set :debug_assets, true

after_configuration do
  sprockets.append_path "#{root}/bower_components/"
end

activate :cordova
activate :automatic_image_sizes
activate :livereload

with_layout :plain do
  page '/views/*'
end

configure :build do
  ignore 'js/lib/*'
  ignore 'css/lib/*'
  activate :minify_css
  activate :minify_javascript, compressor: Uglifier.new(mangle: false)
  activate :asset_hash
  activate :relative_assets
end

use Rack::Cors do
  # allow do
  #   origins 'localhost:3000', '127.0.0.1:3000',
  #           /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
  #   # regular expressions can be used here
  #
  #   resource '/file/list_all/', :headers => 'x-domain-token'
  #   resource '/file/at/*',
  #            :methods => [:get, :post, :put, :delete, :options],
  #            :headers => 'x-domain-token',
  #            :expose  => ['Some-Custom-Response-Header'],
  #            :max_age => 600
  #   # headers to expose
  # end
  #
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options],
             credentials: true,
             max_age: 86400
  end
end
