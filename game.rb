# debugツールの定義
require 'debug'

class Game
    def initialize(user_names) # プレイヤーの名前リストを受け取り、プレイヤーオブジェクトを作成
      @user_names = user_names.map { |name| Users.new(name) }
      @deck = Deck.new # デッキを生成
      deal_cards # カードを配ります
    end
    
    def deal_cards # プレイヤーにカードを配るメソッド
      hands = @deck.deal(@users.size) # デッキからカードを配る
      @users.each_with_index do |user, index| # プレイヤーにカードを配る
        user.receive_cards(hands[index])
      end
    end
    
    def play_round # ラウンドを行うメソッド
        played_cards = @users.map { |user| [user, user.play_card] } # プレイヤーがカードを出す
        winner = played_cards.max_by { |_, card| card.value }[0] # カードの値で勝者を決める
        winner.receive_cards(played_cards.map { |_, card| card }) # 勝者にカードを配る
        puts "#{winner.name} wins this round!" # 勝者の名前を表示
    end

    def play_game # ゲームを行うメソッド
        until @users.any? { |user| user.hand.empty? } # プレイヤーの手札がなくなるまでラウンドを繰り返す
          play_round
        end
        puts "Game over!" # ゲーム終了のメッセージを表示
    end

end

    
      


















