def menu_1
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
          "width": 640,
          "height": 360
        },
        "action": {
          "type": "postback",
          "label": "menu_1",
          "displayText": "menu_1",
          "data": "data_1"
        }
      },
      {
        "bounds": {
          "x": 640,
          "y": 0,
          "width": 640,
          "height": 360
        },
        "action": {
          "type": "message",
          "label": "menu_2",
          "text": "text_2"
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
          "label": "menu_3",
          "uri": "https://liff.line.me/#{ENV["LIFF_ID"]}"
        }
      }
    ]
  }
end
