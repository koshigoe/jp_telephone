# -*- coding: utf-8 -*-
require 'spec_helper'
require 'jp_telephone/number'

describe JpTelephone::Number do
  describe '.normalize' do
    subject { JpTelephone::Number.normalize(number) }
    context 'zenkaku number' do
      let(:number) { '０１２３４５６７８９' }
      it { should == '0123456789' }
    end

    context 'delete not number' do
      let(:number) { '01-2345-6789' }
      it { should == '0123456789' }
    end
  end

  describe '.all_types' do
    subject { JpTelephone::Number.all_types.sort_by{|c| c.name } }
    it do
      should == [
        JpTelephone::Number::IP,
        JpTelephone::Number::Mobile,
        JpTelephone::Number::PHS,
      ]
    end
  end
end
