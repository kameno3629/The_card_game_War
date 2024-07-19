# debugツールの定義
require 'debug'

# デッキの定義をするクラス
class Deck
    attr_reader :cards # attr_readerで値を引っ張れるようにする
  
    def initialize
      suits = Card.cards # スートを取得
      ranks = Card.cards # ランクを取得
       # スートとランクを組み合わせてカードを作成
      @cards = suits.product(ranks).map { |suit, rank| Card.new(suit, rank) }
      shuffle # カードをシャッフルする
    end
  
    def shuffle # 再度シャッフルしたいときに呼び出す
      @cards.shuffle!
    end
  
    def deal(num_users)
      @cards.each_slice(num_users).to_a # カードを配布したいときに呼び出す
    end
end