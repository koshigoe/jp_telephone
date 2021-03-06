# -*- coding: utf-8 -*-
require 'spec_helper'
require 'csv'
require 'jp_telephone/number'

describe JpTelephone::Number::PHS do
  describe '.acceptable?' do
    subject { described_class }

    context 'starts with 070' do
      let(:number) { '07012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts without 070' do
      let(:number) { '09012341234' }
      it { should_not be_acceptable(number) }
    end
  end

  describe '.new' do
    subject { described_class.new(number) }

    describe 'parts' do
      let(:number) { '07012345678' }
      its(:parts) { should == ['070', '123', '45678'] }
    end

    describe 'carrier' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '070.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}12345" do
            let(:number) { "#{prefix}#{n}12345" }
            its(:carrier) { should == row[n] }
          end
        end
      end
    end
  end
end
