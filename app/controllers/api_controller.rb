class ApiController < ApplicationController
  before_action :authenticate_request
  attr_reader :current_user
  respond_to :json

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ArgumentError, with: :render_argument_error

  private

  def required_params?(*required_params)
    if required_params.any? { |required_param| params[required_param].blank? }
      @message = ["Request requires parameters:", required_params.join(', ')].join ' '
      bad_request_error
      false
    else
      true
    end
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    resource_class_name = exception.model.titleize.capitalize if exception.model
    not_found_error(resource_class_name)
  end

  def render_argument_error(exception)
    render json: { error: exception.message }, status: 401
  end

  def bad_request_error
    render json: { error: 'Invalid Request' }, status: 400
  end


end
