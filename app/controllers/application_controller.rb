require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery prepend: true, unless: -> { request.format.json? }
  # protect_from_forgery with: :null_session

  before_action :cors_preflight_check, :set_https_header

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end


  def set_https_header
    response.set_header('X-Frame-Options', 'SAMEORIGIN')
  end

  def current_page
    [[params[:page].to_i, max_number_of_page].min, 1].max
  end

  def current_per_page(max_per_page = 100)
    [params[:per_page].to_i, max_per_page].max
  end

  def max_number_of_page
    (MAX_NUMBER_OF_SKIP_VALUE / current_per_page).floor
  end

  def valid_email? email
    email =~ VALID_EMAIL_REGEX
  end
end
