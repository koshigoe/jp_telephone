# -*- coding: utf-8 -*-
module JpTelephone
  module Number
    class Landline < Base
      AREA_CODE_INDEX = {
        "011" => true,
        "0123" => true,
        "0124" => true,
        "0125" => true,
        "0126" => true,
        "01267" => true,
        "0133" => true,
        "0134" => true,
        "0135" => true,
        "0136" => true,
        "0137" => true,
        "01372" => true,
        "01374" => true,
        "01377" => true,
        "0138" => true,
        "0139" => true,
        "01392" => true,
        "01397" => true,
        "01398" => true,
        "0142" => true,
        "0143" => true,
        "0144" => true,
        "0145" => true,
        "01456" => true,
        "01457" => true,
        "0146" => true,
        "01466" => true,
        "015" => true,
        "0152" => true,
        "0153" => true,
        "0154" => true,
        "01547" => true,
        "0155" => true,
        "01558" => true,
        "0156" => true,
        "01564" => true,
        "0157" => true,
        "0158" => true,
        "01586" => true,
        "01587" => true,
        "0162" => true,
        "0163" => true,
        "01632" => true,
        "01634" => true,
        "01635" => true,
        "0164" => true,
        "01648" => true,
        "0165" => true,
        "01654" => true,
        "01655" => true,
        "01656" => true,
        "01658" => true,
        "0166" => true,
        "0167" => true,
        "017" => true,
        "0172" => true,
        "0173" => true,
        "0174" => true,
        "0175" => true,
        "0176" => true,
        "0178" => true,
        "0179" => true,
        "018" => true,
        "0182" => true,
        "0183" => true,
        "0184" => true,
        "0185" => true,
        "0186" => true,
        "0187" => true,
        "019" => true,
        "0191" => true,
        "0192" => true,
        "0193" => true,
        "0194" => true,
        "0195" => true,
        "0197" => true,
        "0198" => true,
        "022" => true,
        "0220" => true,
        "0223" => true,
        "0224" => true,
        "0225" => true,
        "0226" => true,
        "0228" => true,
        "0229" => true,
        "023" => true,
        "0233" => true,
        "0234" => true,
        "0235" => true,
        "0237" => true,
        "0238" => true,
        "024" => true,
        "0240" => true,
        "0241" => true,
        "0242" => true,
        "0243" => true,
        "0244" => true,
        "0246" => true,
        "0247" => true,
        "0248" => true,
        "025" => true,
        "0250" => true,
        "0254" => true,
        "0255" => true,
        "0256" => true,
        "0257" => true,
        "0258" => true,
        "0259" => true,
        "026" => true,
        "0260" => true,
        "0261" => true,
        "0263" => true,
        "0264" => true,
        "0265" => true,
        "0266" => true,
        "0267" => true,
        "0268" => true,
        "0269" => true,
        "027" => true,
        "0270" => true,
        "0274" => true,
        "0276" => true,
        "0277" => true,
        "0278" => true,
        "0279" => true,
        "028" => true,
        "0280" => true,
        "0282" => true,
        "0283" => true,
        "0284" => true,
        "0285" => true,
        "0287" => true,
        "0288" => true,
        "0289" => true,
        "029" => true,
        "0291" => true,
        "0293" => true,
        "0294" => true,
        "0295" => true,
        "0296" => true,
        "0297" => true,
        "0299" => true,
        "03" => true,
        "04" => true,
        "042" => true,
        "0422" => true,
        "0428" => true,
        "043" => true,
        "0436" => true,
        "0438" => true,
        "0439" => true,
        "044" => true,
        "045" => true,
        "046" => true,
        "0460" => true,
        "0463" => true,
        "0465" => true,
        "0466" => true,
        "0467" => true,
        "047" => true,
        "0470" => true,
        "0475" => true,
        "0476" => true,
        "0478" => true,
        "0479" => true,
        "048" => true,
        "0480" => true,
        "049" => true,
        "0493" => true,
        "0494" => true,
        "0495" => true,
        "04992" => true,
        "04994" => true,
        "04996" => true,
        "04998" => true,
        "052" => true,
        "053" => true,
        "0531" => true,
        "0532" => true,
        "0533" => true,
        "0536" => true,
        "0537" => true,
        "0538" => true,
        "0539" => true,
        "054" => true,
        "0544" => true,
        "0545" => true,
        "0547" => true,
        "0548" => true,
        "055" => true,
        "0550" => true,
        "0551" => true,
        "0553" => true,
        "0554" => true,
        "0555" => true,
        "0556" => true,
        "0557" => true,
        "0558" => true,
        "0561" => true,
        "0562" => true,
        "0563" => true,
        "0564" => true,
        "0565" => true,
        "0566" => true,
        "0567" => true,
        "0568" => true,
        "0569" => true,
        "0572" => true,
        "0573" => true,
        "0574" => true,
        "0575" => true,
        "0576" => true,
        "05769" => true,
        "0577" => true,
        "0578" => true,
        "058" => true,
        "0581" => true,
        "0584" => true,
        "0585" => true,
        "0586" => true,
        "0587" => true,
        "059" => true,
        "0594" => true,
        "0595" => true,
        "0596" => true,
        "0597" => true,
        "05979" => true,
        "0598" => true,
        "0599" => true,
        "06" => true,
        "072" => true,
        "0721" => true,
        "0725" => true,
        "073" => true,
        "0735" => true,
        "0736" => true,
        "0737" => true,
        "0738" => true,
        "0739" => true,
        "0740" => true,
        "0742" => true,
        "0743" => true,
        "0744" => true,
        "0745" => true,
        "0746" => true,
        "07468" => true,
        "0747" => true,
        "0748" => true,
        "0749" => true,
        "075" => true,
        "076" => true,
        "0761" => true,
        "0763" => true,
        "0765" => true,
        "0766" => true,
        "0767" => true,
        "0768" => true,
        "077" => true,
        "0770" => true,
        "0771" => true,
        "0772" => true,
        "0773" => true,
        "0774" => true,
        "0776" => true,
        "0778" => true,
        "0779" => true,
        "078" => true,
        "079" => true,
        "0790" => true,
        "0791" => true,
        "0794" => true,
        "0795" => true,
        "0796" => true,
        "0797" => true,
        "0798" => true,
        "0799" => true,
        "082" => true,
        "0820" => true,
        "0823" => true,
        "0824" => true,
        "0826" => true,
        "0827" => true,
        "0829" => true,
        "083" => true,
        "0833" => true,
        "0834" => true,
        "0835" => true,
        "0836" => true,
        "0837" => true,
        "0838" => true,
        "08387" => true,
        "08388" => true,
        "08396" => true,
        "084" => true,
        "0845" => true,
        "0846" => true,
        "0847" => true,
        "08477" => true,
        "0848" => true,
        "08512" => true,
        "08514" => true,
        "0852" => true,
        "0853" => true,
        "0854" => true,
        "0855" => true,
        "0856" => true,
        "0857" => true,
        "0858" => true,
        "0859" => true,
        "086" => true,
        "0863" => true,
        "08636" => true,
        "0865" => true,
        "0866" => true,
        "0867" => true,
        "0868" => true,
        "0869" => true,
        "087" => true,
        "0875" => true,
        "0877" => true,
        "0879" => true,
        "088" => true,
        "0880" => true,
        "0883" => true,
        "0884" => true,
        "0885" => true,
        "0887" => true,
        "0889" => true,
        "089" => true,
        "0892" => true,
        "0893" => true,
        "0894" => true,
        "0895" => true,
        "0896" => true,
        "0897" => true,
        "0898" => true,
        "092" => true,
        "0920" => true,
        "093" => true,
        "0930" => true,
        "0940" => true,
        "0942" => true,
        "0943" => true,
        "0944" => true,
        "0946" => true,
        "0947" => true,
        "0948" => true,
        "0949" => true,
        "09496" => true,
        "095" => true,
        "0950" => true,
        "0952" => true,
        "0954" => true,
        "0955" => true,
        "0956" => true,
        "0957" => true,
        "0959" => true,
        "096" => true,
        "0964" => true,
        "0965" => true,
        "0966" => true,
        "0967" => true,
        "0968" => true,
        "0969" => true,
        "097" => true,
        "0972" => true,
        "0973" => true,
        "0974" => true,
        "0977" => true,
        "0978" => true,
        "0979" => true,
        "098" => true,
        "0980" => true,
        "09802" => true,
        "0982" => true,
        "0983" => true,
        "0984" => true,
        "0985" => true,
        "0986" => true,
        "0987" => true,
        "099" => true,
        "09912" => true,
        "09913" => true,
        "0993" => true,
        "0994" => true,
        "0995" => true,
        "0996" => true,
        "09969" => true,
        "0997" => true,
      }

      def self.other_types
        JpTelephone::Number.all_types - [self]
      end

      def self.acceptable?(normalized_number)
        normalized_number[0, 1] == '0' \
        && !other_types.any?{|type| type.acceptable?(normalized_number) }
      end

      protected
      def parse(normalized_number)
        return unless prefix = detect_prefix(normalized_number)
        @parts = [
          prefix,
          normalized_number[prefix.length, 6 - prefix.length],
          normalized_number[-4, 4],
        ]
        # TODO: キャリア識別
        # TODO: エリア識別
        # TODO: 使用中判定
      end

      def detect_prefix(normalized_number)
        2.upto(5) do |prefix_length|
          prefix = normalized_number[0, prefix_length]
          return prefix if AREA_CODE_INDEX[prefix]
        end
        nil
      end
    end
  end
end
