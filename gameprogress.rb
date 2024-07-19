# debugツールの定義
require 'debug'

# 各ファイルの読み込み
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'game'

# プレイヤーの名前の設定
player_names = ['player1', 'player2']

# ゲームを初期化
game = Game.new(player_names)

# ゲームを開始
game.play_game

