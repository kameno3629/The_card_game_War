# debugツールの定義
require 'debug'

class Users
    # attr_readerを設定し、手札とプレイヤーネームを引っ張れるようにする
    attr_reader :hand, :name
    # initializeメソッドでプレイヤーネームと手札を初期化
    def initialize(name)
        @name = name # プレイヤーネームを設定
        @hand = [] # 手札を空の配列で初期化
        @reserve_hand = [] ## リザーブハンドを空の配列で初期化
    end
        
    def receive_cards(cards) # 配られたカードを手札に追加するメソッド
        @reserve_hand.concat(cards) ## リザーブハンドにカードを追加
    end
    def play_card ## 手札から一番上のカードを取り出して返すメソッド
        if @hand.empty? && !@reserve_hand.empty? ## 手札が空になったらリザーブハンドのカードを手札に移す
            @hand = @reserve_hand.shuffle ## リザーブハンドのカードをシャッフルして手札に移す
            @reserve_hand = [] ## リザーブハンドを空の配列にする
        end
        card = @hand.shift ## 手札から一番上のカードを取り出して返す
        puts "#{@name}のカードは#{card}です。" ## デバッグ用にカードを表示
        card ## カードを返す
    end

    def total_cards ## 手札とリザーブハンドのカードの合計を返すメソッド
        @hand.size + @reserve_hand.size
    end
end