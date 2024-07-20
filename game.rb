# debugツールの定義
require 'debug'

require_relative 'users'
require_relative 'deck'

class Game
  def initialize(user_names) # プレイヤーの名前リストを受け取り、プレイヤーオブジェクトを作成
    @users = user_names.map { |name| Users.new(name) } # 各プレイヤーのオブジェクトを作成
    @deck = Deck.new # デッキを生成
    deal_cards # カードを配ります
  end

  def deal_cards # プレイヤーにカードを配るメソッド
    hands = @deck.deal(@users.size) # デッキからプレイヤーの数に応じてカードを配る
    @users.each_with_index do |user, index| # 各プレイヤーにカードを配る
      user.receive_cards(hands[index]) # プレイヤーにカードを渡す
    end
  end

  def play_round(played_cards = []) # ラウンドを行うメソッド
    new_played_cards = @users.map { |user| [user, user.play_card] } # 各プレイヤーがカードを1枚出す
    played_cards.concat(new_played_cards) # 既に場に出ているカードに追加する

    # 勝者を決定する
    max_value = new_played_cards.map { |_, card| card.value }.max # 出されたカードの中で最大の値を取得
    winners = new_played_cards.select { |_, card| card.value == max_value }.map { |user, _| user } # 最大の値を持つカードを出したプレイヤーを取得

    if winners.size > 1 # 引き分けの場合
      puts "引き分けです。もう一枚カードを出します。" # 引き分けメッセージを表示
      play_round(played_cards) # 引き分けの場合、再度カードを出す
    else
      winner = winners.first # 勝者を決定
      winner_cards = played_cards.map { |_, card| card } # 勝者のカードを配列で取得
      winner.receive_cards(winner_cards) # 勝者にカードを配る
      puts "#{winner.name}が勝ちました。" # 勝者の名前を表示
    end
  end

  def play_game # ゲームを行うメソッド
    puts "戦争を開始します。" # ゲーム開始のメッセージを表示
    until @users.any? { |user| user.total_cards == 0 } # プレイヤーの手札がなくなるまでラウンドを繰り返す
      play_round # ラウンドを実行
    end
    puts "戦争を終了します" # ゲーム終了のメッセージを表示
  end
end