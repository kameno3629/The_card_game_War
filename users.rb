# debugツールの定義
require 'debug'

class Users
    # attr_readerを設定し、手札とプレイヤーネームを引っ張れるようにする
    attr_reader :hand, :name
    # initializeメソッドでプレイヤーネームと手札を初期化
    def initialize(name)
        @name = name # プレイヤーネームを設定
        @hand = [] # 手札を空の配列で初期化
    end
        
    def receive_cards(cards) # 配られたカードを手札に追加するメソッド
        @hand.concat(cards)
    end
    def play_card # 手札から一番上のカードを取り出して返すメソッド
        @hand.shift
    end
end
