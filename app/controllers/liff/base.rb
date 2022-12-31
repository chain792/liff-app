class Liff::Base < ApplicationController
  skip_before_action :authenticate_applicant!
  layout 'liff'

  private

  def user_signed_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
