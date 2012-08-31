# -*- coding: utf-8 -*-
require 'jp_telephone/parser'

module JpTelephone
  module Number
    class Business < Base
      def self.acceptable?(normalized_number)
        normalized_number[0, 2] == '00'
      end

      attr_reader :number

      protected
      def parse(normalized_number)
        carrier_number, number = case normalized_number[0, 3]
                                 when '001'
                                   [normalized_number[0, 3], normalized_number[3..-1]]
                                 when /00[2-8]/
                                   [normalized_number[0, 5], normalized_number[5..-1]]
                                 when /009/
                                   [normalized_number[0, 6], normalized_number[6..-1]]
                                 end
        @number = JpTelephone::Parser.new.parse(number)
        @parts = [carrier_number] + @number.to_a
        detect_carrier
      end

      def detect_carrier
        @carrier = case @parts[0]
                   when '001', '0051'..'0057', '0070', '0077'
                     'ＫＤＤＩ'
                   when '0030'
                     'ＺＩＰ　Ｔｅｌｅｃｏｍ'
                   when '0031', '0032'
                     'アイ・ピー・エス'
                   when '0033'..'0035'
                     'ＮＴＴコミュニケーションズ'
                   when '0036'
                     'ＮＴＴ東日本'
                   when '0037', '0038', '0081', '0082'
                     'フュージョンコミュニケーションズ'
                   when '0039'
                     'ＮＴＴ西日本'
                   when '0041'..'0046'
                     'ソフトバンクモバイル'
                   when '0050', '0060'
                     'ＵＣＯＭ'
                   when '0061'..'0063', '0065', '0066', '0083', '0084', '0088'
                     'ソフトバンクテレコム'
                   when '0071', '0072'
                     'ベライゾンジャパン'
                   when '0073', '0074'
                     '安子の電話'
                   when '0080', '0089'
                     'Ｔシステムズ・ジャパン'
                   when '0085'
                     'ＮＴＴメディアクロス'
                   when '0086'
                     '九州通信ネットワーク'
                   when '009120', '009121'
                     'ブラステル'
                   when '009130'
                     'ドコモ'
                   when '009155', '009156'
                     'ＮＴＴ－ＭＥ'
                   when '009177', '009198'
                     'ソフトバンクＢＢ'
                   when '009181'
                     '関西コムネット'
                   when '009191', '009192'
                     'ＮＴＴぷらら'
                   end
      end
    end
  end
end
