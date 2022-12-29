class Api::Base < ApplicationController
  skip_before_action :require_login
  before_action :xhr_request?

  private

  def xhr_request?
    return if request.xhr?

    head :forbidden
  end
end
