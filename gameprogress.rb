# frozen_string_literal: true

require 'debug'
require_relative 'card'
require_relative 'deck'
require_relative 'users'
require_relative 'game'

puts '戦争を開始します。'

# プレイヤーの人数を入力
num_users = 0
until num_users.between?(2, 5)
  print 'プレイヤーの人数を入力してください（2〜5）: '
  num_users = gets.to_i
end

# プレイヤーの名前を入力
user_names = []
num_users.times do |i|
  print "プレイヤー#{i + 1}の名前を入力してください: "
  user_names << gets.chomp
end

# ゲームを初期化
game = Game.new(user_names)

puts 'カードが配られました。'

# ゲームを開始
game.play_game
