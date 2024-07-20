# debugツールの定義
require 'debug'

# 各ファイルの読み込み
require_relative 'card'
require_relative 'deck'
require_relative 'users'
require_relative 'game'

# プレイヤーの名前の設定
user_names = ['User1', 'User2', 'User3', 'User4']

# ゲームを初期化
game = Game.new(user_names)

# ゲームを開始
game.play_game

