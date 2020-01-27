class GlobalApiController < ApiController
  skip_before_action :authenticate_request
end
