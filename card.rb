# debugツールの定義
require 'debug'

# カードの要素を定義するクラス
class Card
    # attr_readerで値を引っ張れるようにする
    attr_reader :suit, :rank, :value
    # 配列スート、ランク、バリューをそれぞれ設定する。
    SUIT = [Diamond, Spade, Heart, Crub]
    RANK = [A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K]
    VALUE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    # initializedで初期化
    def initialize (suit, rank, value)
        @suit = suit
        @rank = rank
        @value = value
    end
    # to_sでカードの情報を文字列で表示できるようにする
    def to_s
        "#{@rank} of #{@suit}"
    end
end



