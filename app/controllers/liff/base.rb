class Liff::Base < ApplicationController
  skip_before_action :require_login
  layout 'liff'

end
