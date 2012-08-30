# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class NaviDial < Base
      def self.acceptable?(normalized_number)
        normalized_number[0, 4] == '0570'
      end

      protected
      def parse(normalized_number)
        return unless /\A(\d{4})(\d{3})(\d{4})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_carrier
      end

      # http://www.soumu.go.jp/main_content/000124101.pdf
      def detect_carrier
        @carrier = case @parts[1].to_i
                   when 0..99, 200, 550, 666, 783
                     'ＮＴＴコミュニケーションズ'
                   when 100..102
                     'ＮＴＴ東日本'
                   when 111, 222, 333, 555, 777
                     'ＫＤＤＩ'
                   when 300, 881, 882, 888, 919, 999
                     'ソフトバンクテレコム'
                   when 570..572
                     'ウィルコム'
                   end
      end
    end
  end
end
