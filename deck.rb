# debugツールの定義
require 'debug'

require_relative 'card'

# デッキの定義をするクラス
class Deck
    attr_reader :cards # attr_readerで値を引っ張れるようにする
  
    def initialize
        @cards = Card.all_cards # 全てのカードを取得
      shuffle # カードをシャッフルする
    end
  
    def shuffle # 再度シャッフルしたいときに呼び出す
      @cards.shuffle!
    end
  
    def deal(num_users)
        # カードの枚数にあまりが出た場合は捨て札として扱う
        cards_to_deal = @cards.take(@cards.size - @cards.size % num_users)
        cards_to_deal.each_slice(cards_to_deal.size / num_users).to_a
    end
end