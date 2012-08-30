# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class PHS < Base
      def self.acceptable?(normalized_number)
        normalized_number[0,3] == '070'
      end

      protected
      def parse(normalized_number)
        return unless /\A(\d{3})(\d{3})(\d{5})/ =~ normalized_number
        @parts = $1, $2, $3
        detect_carrier
      end

      # http://www.soumu.go.jp/main_content/000124097.pdf
      def detect_carrier
        @carrier = case @parts[1].to_i
                   when 501..569, 581, 610..636, 640..669, 680..685, 690..699
                     'ウィルコム'
                   end
      end
    end
  end
end
