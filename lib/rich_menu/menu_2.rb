def menu_2
  {
    "size": {
      "width": 1280,
      "height": 720
    },
    "selected": true,
    "name": "rich_menu_1",
    "chatBarText": "メニュー",
    "areas": [
      {
        "bounds": {
          "x": 0,
          "y": 0,
          "width": 1280,
          "height": 360
        },
        "action": {
          "type": "postback",
          "label": "menu_1",
          "data": "rich_menu"
        }
      },
      {
        "bounds": {
          "x": 0,
          "y": 360,
          "width": 1280,
          "height": 360
        },
        "action": {
          "type": "uri",
          "label": "menu_2",
          "uri": "https://liff.line.me/#{ENV["LIFF_ID"]}"
        }
      }
    ]
  }
end
