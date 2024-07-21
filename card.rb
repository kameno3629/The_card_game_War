# debugツールの定義
require 'debug'

# カードの要素を定義するクラス
class Card
    # attr_readerで値を引っ張れるようにする
    attr_reader :suit, :rank, :value
    # 配列スート、ランク、バリューをそれぞれ設定する。
    SUITS = ['Diamond', 'Spade', 'Heart', 'Club']
    RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    VALUES = {
        '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
        'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14, 'Joker' => 15
    }
    # initializedで初期化
    def initialize (suit, rank)
        @suit = suit
        @rank = rank
        @value = VALUES[rank]
    end
    # カードの情報を文字列で表示するメソッド
    def to_s
        "#{@rank} of #{@suit}"
    end
    # 全てのカードを生成するクラスメソッド
    def self.all_cards
        cards = SUITS.product(RANKS).map { |suit, rank| new(suit, rank) }
        cards << new('None', 'Joker') # ジョーカーを1枚追加
        cards
    end
end



