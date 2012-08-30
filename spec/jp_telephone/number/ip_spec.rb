# -*- coding: utf-8 -*-
require 'spec_helper'
require 'jp_telephone/number'

describe JpTelephone::Number::IP do
  describe '.acceptable?' do
    subject { JpTelephone::Number::IP }

    context 'starts with 050' do
      let(:number) { '05012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts without 050' do
      let(:number) { '09012341234' }
      it { should_not be_acceptable(number) }
    end
  end

  describe '.new' do
    subject { JpTelephone::Number::IP.new(number) }

    describe 'parts' do
      let(:number) { '05012345678' }
      its(:parts) { should == ['050', '1234', '5678'] }
    end

    describe 'carrier' do
      context '050-1000' do
        let(:number) { '05010001234' }
        its(:carrier) { should == 'ソフトバンクＢＢ' }
      end

      context '050-1812' do
        let(:number) { '05018121234' }
        its(:carrier) { should == 'ソフトバンクＢＢ' }
      end

      context '050-2000' do
        let(:number) { '05020001234' }
        its(:carrier) { should == 'ソフトバンクテレコム' }
      end

      context '050-2036' do
        let(:number) { '05020361234' }
        its(:carrier) { should == 'ソフトバンクテレコム' }
      end

      context '050-2200' do
        let(:number) { '05022001234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-2201' do
        let(:number) { '05022011234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-2525' do
        let(:number) { '05025251234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-3000' do
        let(:number) { '05030001234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-3251' do
        let(:number) { '05032511234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-5200' do
        let(:number) { '05052001234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-5209' do
        let(:number) { '05052091234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-6000' do
        let(:number) { '05060001234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-7000' do
        let(:number) { '05070001234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-7001' do
        let(:number) { '05070011234' }
        its(:carrier) { should == 'ＫＤＤＩ' }
      end

      context '050-2403' do
        let(:number) { '05024031234' }
        its(:carrier) { should == 'ＮＴＴ－ＭＥ' }
      end

      context '050-5540' do
        let(:number) { '05055401234' }
        its(:carrier) { should == 'ＮＴＴ－ＭＥ' }
      end

      context '050-5569' do
        let(:number) { '05055691234' }
        its(:carrier) { should == 'ＮＴＴ－ＭＥ' }
      end

      context '050-3300' do
        let(:number) { '05033001234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-3849' do
        let(:number) { '05038491234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-3900' do
        let(:number) { '05039001234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-3901' do
        let(:number) { '050339011234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-8600' do
        let(:number) { '050860011234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-8601' do
        let(:number) { '050860111234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-8686' do
        let(:number) { '050868611234' }
        its(:carrier) { should == 'ＮＴＴコミュニケーショ' }
      end

      context '050-5000' do
        let(:number) { '05050001234' }
        its(:carrier) { should == 'アイテック阪急阪' }
      end

      context '050-5009' do
        let(:number) { '05050091234' }
        its(:carrier) { should == 'アイテック阪急阪' }
      end

      context '050-5500' do
        let(:number) { '05055001234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-5539' do
        let(:number) { '05055391234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-5787' do
        let(:number) { '05057871234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-5859' do
        let(:number) { '05058591234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-8000' do
        let(:number) { '05080001234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-8038' do
        let(:number) { '05080381234' }
        its(:carrier) { should == 'フュージョンコミュニケーショ' }
      end

      context '050-6100' do
        let(:number) { '05061001234' }
        its(:carrier) { should == '日本通信株式会社' }
      end

      context '050-6619' do
        let(:number) { '05066191234' }
        its(:carrier) { should == '九州通信ネットワーク' }
      end

      context '050-6622' do
        let(:number) { '05066221234' }
        its(:carrier) { should == '九州通信ネットワーク' }
      end

      context '050-6860' do
        let(:number) { '05068601234' }
        its(:carrier) { should == 'ＺＩＰ　Ｔｅｌｅｃｏｍ' }
      end

      context '050-6868' do
        let(:number) { '05068681234' }
        its(:carrier) { should == 'ＺＩＰ　Ｔｅｌｅｃｏｍ' }
      end

      context '050-7100' do
        let(:number) { '05071001234' }
        its(:carrier) { should == 'ケイ・オプティコ' }
      end

      context '050-7113' do
        let(:number) { '05071131234' }
        its(:carrier) { should == 'ケイ・オプティコ' }
      end

      context '050-7300' do
        let(:number) { '05073001234' }
        its(:carrier) { should == 'フリービット' }
      end

      context '050-7303' do
        let(:number) { '05073031234' }
        its(:carrier) { should == 'フリービット' }
      end

      context '050-7500' do
        let(:number) { '05075001234' }
        its(:carrier) { should == 'ＮＴＴぷらら' }
      end

      context '050-7625' do
        let(:number) { '05076251234' }
        its(:carrier) { should == 'ＮＴＴぷらら' }
      end

      context '050-7770' do
        let(:number) { '05077701234' }
        its(:carrier) { should == '中部テレコミュニケーショ' }
      end

      context '050-7775' do
        let(:number) { '05077751234' }
        its(:carrier) { should == '中部テレコミュニケーショ' }
      end

      context '050-7788' do
        let(:number) { '05077881234' }
        its(:carrier) { should == '東北インテリジェント通信' }
      end

      context '050-8200' do
        let(:number) { '05082001234' }
        its(:carrier) { should == 'エネルギア・コミュニケーションズ' }
      end

      context '050-8203' do
        let(:number) { '05082031234' }
        its(:carrier) { should == 'エネルギア・コミュニケーションズ' }
      end

      context '050-8800' do
        let(:number) { '05088001234' }
        its(:carrier) { should == 'ＳＴＮｅｔ' }
      end

      context '050-8810' do
        let(:number) { '05088101234' }
        its(:carrier) { should == 'ＳＴＮｅｔ' }
      end

      context '050-8864' do
        let(:number) { '05088641234' }
        its(:carrier) { should == 'ＮＴＴ－ＰＣ' }
      end

      context '050-8868' do
        let(:number) { '05088681234' }
        its(:carrier) { should == 'ＮＴＴ－ＰＣ' }
      end

      context '050-8880' do
        let(:number) { '05088801234' }
        its(:carrier) { should == 'ＵＣＯＭ' }
      end

      context '050-8886' do
        let(:number) { '05088861234' }
        its(:carrier) { should == 'ＵＣＯＭ' }
      end

      context '050-9000' do
        let(:number) { '05090001234' }
        its(:carrier) { should == 'ドコモ' }
      end

      context '050-9015' do
        let(:number) { '05090151234' }
        its(:carrier) { should == 'ドコモ' }
      end

      # context '050-' do
      #   let(:number) { '0501234' }
      #   its(:carrier) { should == '' }
      # end

      # context '050-' do
      #   let(:number) { '0501234' }
      #   its(:carrier) { should == '' }
      # end
    end
  end
end
