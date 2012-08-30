# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class PocketBell < Base
      def self.acceptable?(normalized_number)
        normalized_number[0,3] == '020'
      end

      protected
      def parse(normalized_number)
        return unless /\A(\d{3})(\d{3})(\d{5})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_carrier
      end

      # http://www.soumu.go.jp/main_content/000124094.pdf
      def detect_carrier
        @carrier = case @parts[1].to_i
                   when 460..469
                     '東京テレメッセージ'
                   when 492, 499
                     '沖縄テレメッセージ'
                   end
      end
    end
  end
end
