class ApplicationController < ActionController::Base
  before_action :authenticate

  USERNAMES = ENV["USERNAMES"]&.split(',') || ["adhdgpt"]
  PASSWORDS = ENV["PASSWORDS"]&.split(',') || [ENV["PASSWORD"]]

  if Rails.env.production? && PASSWORDS.any?(&:blank?)
    raise "Can't launch with an empty password"
  end

  def authenticate
    unless !Rails.env.production? || authenticate_with_http_basic { |u,p| USERNAMES.include?(u) && PASSWORDS.include?(p) }
      request_http_basic_authentication
    end
  end
end
