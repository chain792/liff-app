require './lib/rich_menu/menu_1'

namespace :rich_menu do
  desc 'リッチメニューを作成する'
  task :create_rich_menu do
    client = Line::Bot::Client.new { |config|
      config.channel_secret = Rails.application.credentials.dig(:line, :channel_secret)
      config.channel_token = Rails.application.credentials.dig(:line, :channel_token)
    }

    # リッチメニューを作成
    rich_menu = menu_1
    res = client.create_rich_menu(rich_menu)
    body = JSON.parse res.body
    p body

    # リッチメニューに画像をつける
    file=File.open('./lib/rich_menu/image_1.png', 'rb')    
    res = client.create_rich_menu_image(body["richMenuId"], file)
    p res.body
    
    # デフォルトのリッチメニューに設定する
    res = client.set_default_rich_menu(body["richMenuId"])
    p res.body
  end
end
