# debugツールの定義
require 'debug'

class Game
    def initialize(player_names) # プレイヤーの名前リストを受け取り、プレイヤーオブジェクトを作成
      @player_names = player_names.map { |name| User.new(name) }
      @deck = Deck.new # デッキを生成
      deal_cards # カードを配ります
    end
    
    def deal_cards # プレイヤーにカードを配るメソッド
      hands = @deck.deal(@players.size) # デッキからカードを配る
      @players.each_with_index do |player, index| # プレイヤーにカードを配る
        player.receive_cards(hands[index])
    end
    
    def play_round # ラウンドを行うメソッド
        played_cards = @players.map { |player| [player, player.play_card] } # プレイヤーがカードを出す
        winner = played_cards.max_by { |_, card| card.value }[0] # カードの値で勝者を決める
        winner.receive_cards(played_cards.map { |_, card| card }) # 勝者にカードを配る
        puts "#{winner.name} wins this round!" # 勝者の名前を表示
    end

    def play_game # ゲームを行うメソッド
        until @players.any? { |player| player.hand.empty? } # プレイヤーの手札がなくなるまでラウンドを繰り返す
          play_round
        end
        puts "Game over!" # ゲーム終了のメッセージを表示
    end

end

    
      


















