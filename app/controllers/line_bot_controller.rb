class LineBotController < ApplicationController
  skip_before_action :authenticate_applicant!
  protect_from_forgery except: [:callback]

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      return head :bad_request
    end
    events = client.parse_events_from(body)
    events.each do |event|
      message = {}
      case event
      when Line::Bot::Event::Postback
        case event["postback"]["data"]
        when "rich_menu"
          message = {
            "type": "template",
            "altText": "this is a confirm template",
            "template": {
              "type": "confirm",
              "text": "運命の二択です。 右か左どちらかを選択してください。",
              "actions": [
                {
                  "type": "postback",
                  "label": "左",
                  "data": "left"
                },
                {
                  "type": "postback",
                  "label": "右",
                  "data": "right"
                }
              ]
            }
          }
          client.reply_message(event['replyToken'], message)
        when "left", "right"
          if event["postback"]["data"] == ["left", "right"].sample
            message = {
              "type": "sticker",
              "packageId": "8522",
              "stickerId": "16581289"
            }
          else
            message = {
              "type": "sticker",
              "packageId": "6325",
              "stickerId": "10979917"
            }        
          end
        end
      end
      if message.present?
        client.reply_message(event['replyToken'], message)
      end
    end
    head :ok
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = Rails.application.credentials.dig(:line, :messaging, :channel_secret)
      config.channel_token = Rails.application.credentials.dig(:line, :messaging, :channel_token)
    }
  end
end
