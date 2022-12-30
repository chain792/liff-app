class Liff::SessionsController < Liff::Base

  def create
    if !user_signed_in?
      res = client.verify_id_token(params[:idToken])
      body = JSON.parse res.body
      user = User.find_or_create_by!(user_id: body["sub"])
      session[:user_id] = user.id
    end
    head :ok
  end

  private

  def client
    @client = Line::Bot::Client.new { |config|
      config.channel_id = Rails.application.credentials.dig(:line, :login, :channel_id)
    }
  end
end