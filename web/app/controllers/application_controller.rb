class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "adhdgpt", password: ENV["PASSWORD"] if Rails.env.production?
end
