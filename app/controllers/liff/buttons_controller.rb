class Liff::ButtonsController < Liff::Base


  def create
    message = {
      type: 'text',
      text: 'hello'
    }
    response = client.push_message(current_user.user_id, message)
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = Rails.application.credentials.dig(:line, :messaging, :channel_secret)
      config.channel_token = Rails.application.credentials.dig(:line, :messaging, :channel_token)
    }
  end
end