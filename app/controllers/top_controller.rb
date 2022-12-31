class TopController < ApplicationController
  skip_before_action :authenticate_applicant!

  def index
  end
end