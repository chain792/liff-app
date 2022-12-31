class Liff::ButtonsController < Liff::Base


  def create
    if current_user.button.blank?
      current_user.build_button.save!
    end
    button = current_user.button
    button.number = button.number + 1
    button.save!
    message = {
      type: 'text',
      text: "#{button.number}回押したよ！"
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