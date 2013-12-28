class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :flash_to_headers

  private
  def flash_to_headers
    return unless request.xhr?
    flash.discard
  end
end
