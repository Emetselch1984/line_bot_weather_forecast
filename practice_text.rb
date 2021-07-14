require 'line/bot'  # gem 'line-bot-api'
require 'open-uri'
require 'kconv'
require 'rexml/document'

def callback(text)
  input =text
  # input = event.message['text']
  min_per = 30
  per06to12 = "0"
  per12to18 = "0"
  per18to24 ="0"

  case input
  when /.*(明日|あした).*/
    if per06to12.to_i >= min_per || per12to18.to_i >= min_per || per18to24 >= min_per
      push =
        "明日の天気だよね。\n明日は雨が降りそうだよ(>_<)\n今のところ降水確率はこんな感じだよ。\n　  6〜12時　#{per06to12}％\n　12〜18時　 #{per12to18}％\n　18〜24時　#{per18to24}％\nまた明日の朝の最新の天気予報で雨が降りそうだったら教えるね！"
    else
      push =
        "明日の天気？\n明日は雨が降らない予定だよ(^^)\nまた明日の朝の最新の天気予報で雨が降りそうだったら教えるね！"
    end
  when /.*(明後日|あさって).*/
    if per06to12.to_i >= min_per || per12to18.to_i >= min_per || per18to24 >= min_per
      push =
        "明後日の天気だよね。\n何かあるのかな？\n明後日は雨が降りそう…\n当日の朝に雨が降りそうだったら教えるからね！"
    else
      push =
      "明後日の天気？\n気が早いねー！何かあるのかな。\n明後日は雨は降らない予定だよ(^^)\nまた当日の朝の最新の天気予報で雨が降りそうだったら教えるからね！"
    end
  when /.*(かわいい|可愛い|カワイイ|きれい|綺麗|キレイ|素敵|ステキ|すてき|面白い|おもしろい|ありがと|すごい|スゴイ|スゴい|好き|頑張|がんば|ガンバ).*/
    push =
      "ありがとう！！！\n優しい言葉をかけてくれるあなたはとても素敵です(^^)"
  when /.*(こんにちは|こんばんは|初めまして|はじめまして|おはよう).*/
    push =
      "こんにちは。\n声をかけてくれてありがとう\n今日があなたにとっていい日になりますように(^^)"
  else
    if per06to12.to_i >= min_per || per12to18.to_i >= min_per || per18to24.to_i >= min_per
      word =
        ["雨だけど元気出していこうね！",
         "雨に負けずファイト！！",
         "雨だけどああたの明るさでみんなを元気にしてあげて(^^)"].sample
      push =
        "今日の天気？\n今日は雨が降りそうだから傘があった方が安心だよ。\n　  6〜12時　#{per06to12}％\n　12〜18時　 #{per12to18}％\n　18〜24時　#{per18to24}％\n#{word}"
    else
      word =
        ["天気もいいから一駅歩いてみるのはどう？(^^)",
         "今日会う人のいいところを見つけて是非その人に教えてあげて(^^)",
         "素晴らしい一日になりますように(^^)",
         "雨が降っちゃったらごめんね(><)"].sample
      push =
        "今日の天気？\n今日は雨は降らなさそうだよ。\n#{word}"
    end
  end
end
text = "こんにちは"
p callback(text)