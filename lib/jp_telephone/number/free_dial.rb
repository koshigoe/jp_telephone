# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class FreeDial < Base
      def self.acceptable?(normalized_number)
        %w(0800 0120).include? normalized_number[0,4]
      end

      protected
      def parse(normalized_number)
        case normalized_number
        when /\A(0120)(\d{3})(\d{3})/
          @parts = $1, $2, $3
        when /\A(0800)(\d{3})(\d{4})/
          @parts = $1, $2, $3
        end
        detect_carrier
      end

      def detect_carrier
        case @parts[0]
        when '0120'
          detect_carrier_for_0120
        when '0800'
          detect_carrier_for_0800
        end
      end

      # http://www.soumu.go.jp/main_content/000124100.pdf
      def detect_carrier_for_0120
        @carrier = case @parts[1].to_i
                   when 0..899, 950
                     'ＮＴＴコミュニケーションズ'
                   when 910, 913, 915, 916, 918, 940, 954, 970..973, 978,  980
                     'ＮＴＴ東日本'
                   when 911, 914, 921..926, 929, 933, 944, 959, 977, 983..985, \
                     988, 993..996
                     'ＫＤＤＩ'
                   when 912, 917, 919, 934..938, 941, 945, 948, 978, 951..953, \
                     956..958, 964, 965, 974, 975, 981, 982, 989, 992, 997..999
                     'ソフトバンクテレコム'
                   when 920, 927, 928, 930..932, 939, 937, 947, 960, 967..969, \
                     976
                     'ＮＴＴ西日本'
                   when 949, 961..963, 979, 987
                     'フュージョンコミュニケーションズ'
                   when 955, 966
                     'ＵＣＯＭ'
                   when 986
                     '九州通信ネットワーク'
                   when 990..991
                     'ソフトバンクモバイル'
                   end
      end

      # http://www.soumu.go.jp/main_content/000124102.pdf
      def detect_carrier_for_0800
        @carrier = case @parts[1].to_i
                   when 0, 333..399, 555..599, 641..699, 924..999
                     'ＮＴＴコミュニケーションズ'
                   when 80, 123, 300, 500, 700, 777
                     'ＫＤＤＩ'
                   when 100, 111, 170, 222, 888, 919
                     'ソフトバンクテレコム'
                   when 120
                     '九州通信ネットワーク'
                   when 200, 550
                     'ＮＴＴ西日本'
                   when 400, 900
                     'ＵＣＯＭ'
                   when 800, 880
                     'ＮＴＴ東日本'
                   when 600..603, 805..809
                     'フュージョンコミュニケーションズ'
                   end
      end
    end
  end
end
