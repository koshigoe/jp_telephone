# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class Q2 < Base
      def self.acceptable?(normalized_number)
        normalized_number[0, 4] == '0990'
      end

      protected
      def parse(normalized_number)
        return unless /\A(\d{4})(\d{3})(\d{4})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_carrier
      end

      # http://www.soumu.go.jp/main_content/000124103.pdf
      def detect_carrier
        @carrier = case @parts[1].to_i
                   when 500..509, 530..538, 540..547, 549, 580, 581, 583..589, \
                     600..603, 605..607, 630, 632..634, 638, 640, 641, 644, \
                     647, 648, 680, 681, 685, 689
                     'ＮＴＴ西日本'
                   when 510..529, 610..613, 615..617, 619..621, 623..629
                     'ＮＴＴ東日本'
                   end
      end
    end
  end
end
