# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class IP < Base
      def self.acceptable?(normalized_number)
        normalized_number[0, 3] == '050'
      end

      attr_reader :company

      protected
      def parse(normalized_number)
        return unless /\A(\d{3})(\d{4})(\d{4})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_company
      end

      # http://www.soumu.go.jp/main_content/000124095.pdf
      def detect_company
        @company = case @parts[1].to_i
                   when 1000..1812
                     'ソフトバンクＢＢ'
                   when 2000..2036
                     'ソフトバンクテレコム'
                   when 2200..2201, 2525, 3000..3251, 5200..5209, 6000, 7000..7001
                     'ＫＤＤＩ'
                   when 2403, 5540..5569
                     'ＮＴＴ－ＭＥ'
                   when 3300..3849, 3900..3901, 8600..8601, 8686
                     'ＮＴＴコミュニケーショ'
                   when 5000..5009
                     'アイテック阪急阪'
                   when 5500..5539, 5787..5859, 8000..8038
                     'フュージョンコミュニケーショ'
                   when 6100
                     '日本通信株式会社'
                   when 6619..6622
                     '九州通信ネットワーク'
                   when 6860..6868
                     'ＺＩＰ　Ｔｅｌｅｃｏｍ'
                   when 7100..7113
                     'ケイ・オプティコ'
                   when 7300..7303
                     'フリービット'
                   when 7500..7625
                     'ＮＴＴぷらら'
                   when 7770..7775
                     '中部テレコミュニケーショ'
                   when 7788
                     '東北インテリジェント通信'
                   when 8200..8203
                     'エネルギア・コミュニケーションズ'
                   when 8800..8810
                     'ＳＴＮｅｔ'
                   when 8864..8868
                     'ＮＴＴ－ＰＣ'
                   when 8880..8886
                     'ＵＣＯＭ'
                   when 9000..9015
                     'ドコモ'
                   else
                     nil
                   end
      end
    end
  end
end
