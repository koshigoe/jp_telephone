# -*- coding: utf-8 -*-
require 'spec_helper'
require 'jp_telephone/parser'

describe JpTelephone::Parser do
  describe '#parse' do
    context 'type of telephone number is unknown' do
      it 'should raise JpTelephone::ParserNotFound' do
        expect {
          described_class.new.parse('１２３４５６７８９０')
        }.to raise_error(JpTelephone::ParserNotFound, '1234567890')
      end
    end

    describe 'type' do
      subject { described_class.new.parse(number) }
      context 'IP電話' do
        let(:number) { '05012341234' }
        it { should be_an_instance_of JpTelephone::Number::VoIP }
      end
      context '固定電話' do
        let(:number) { '0312341234' }
        it { should be_an_instance_of JpTelephone::Number::Landline }
      end
      context '携帯電話(090)' do
        let(:number) { '09012312345' }
        it { should be_an_instance_of JpTelephone::Number::Mobile }
      end
      context '携帯電話(080)' do
        let(:number) { '0801231234' }
        it { should be_an_instance_of JpTelephone::Number::Mobile }
      end
      context 'PHS電話番号' do
        let(:number) { '07012312345' }
        it { should be_an_instance_of JpTelephone::Number::PHS }
      end
      context '発信者課金ポケベル電話番号' do
        let(:number) { '02012312345' }
        it { should be_an_instance_of JpTelephone::Number::PocketBell }
      end
      context '着信課金用電話番号(0120)' do
        let(:number) { '01201231234' }
        it { should be_an_instance_of JpTelephone::Number::FreeDial }
      end
      context '着信課金用電話番号(0800)' do
        let(:number) { '08001231234' }
        it { should be_an_instance_of JpTelephone::Number::FreeDial }
      end
      context '統一番号用電話番号' do
        let(:number) { '05701231234' }
        it { should be_an_instance_of JpTelephone::Number::NaviDial }
      end
      context '情報料代理徴収用電話番号' do
        let(:number) { '09901231234' }
        it { should be_an_instance_of JpTelephone::Number::Q2 }
      end
    end
  end
end
