# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class Mobile < Base
      def self.acceptable?(normalized_number)
        %w(080 090).include? normalized_number[0,3]
      end

      protected
      def parse(normalized_number)
        return unless /\A(\d{3})(\d{3})(\d{5})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_carrier
      end

      # NOTE: 番号ポータビリティの影響で、実際に契約している携帯電話会社とは異なる可能性がある
      def detect_carrier
        case @parts[0]
        when '090'
          detect_carrier_for_090
        when '080'
          detect_carrier_for_080
        end
      end

      # 090-: http://www.soumu.go.jp/main_content/000124099.pdf
      def detect_carrier_for_090
        @carrier = case @parts[1].to_i
                   when 100..109, 111..112, 140..169, 187..189, 198..199, \
                     210..279, 300..340, 346..349, 400..409, 411..414, 430..439, \
                     450..599, 669, 676..682, 684, 688..749, 760..803, 841..842, \
                     857..859, 863..909, 950..959
                     'ドコモ'
                   when 110, 113..129, 180..186, 190..193, 195..197, 200..209, \
                     290..291, 293..294, 343..345, 350..378, 380..389, 398..399, \
                     415..425, 440..446, 448..449, 610..639, 670..675, 683, 685, \
                     687, 750..759, 804..806, 808, 810..828, 830..833, 836..839, \
                     843..844, 920..939, 960..964, 966..967, 970..977, 979
                     'ＫＤＤＩ'
                   when 130..139, 170..179, 280..289, 292, 295..299, 341..342, \
                     390..397, 410, 426..429, 600..609, 640..668, 807, 809, \
                     834..835, 840, 845..856, 860..862, 910..919, 940..949, \
                     965, 968..969, 980..999
                     'ソフトバンクモバイル'
                   when 194, 379, 447, 686, 829, 978
                     '沖縄セルラー'
                   end
      end

      # 080-: http://www.soumu.go.jp/main_content/000124098.pdf
      def detect_carrier_for_080
        @carrier = case @parts[1].to_i
                   when 100..299, 800..899, 920..929, 950..959, 990..996
                     'ドコモ'
                   when 500..647, 650..699, 900..909, 930..939, 980..984
                     'ＫＤＤＩ'
                   when 300..499, 797..799, 910..919, 940..949, 960..979
                     'ソフトバンクモバイル'
                   when 648..649, 985
                     '沖縄セルラー'
                   when 700..768
                     'イー・アクセス'
                   end
      end
    end
  end
end
