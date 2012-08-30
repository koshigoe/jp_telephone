# -*- coding: utf-8 -*-
require 'spec_helper'
require 'csv'
require 'jp_telephone/number'

describe JpTelephone::Number::Mobile do
  describe '.acceptable?' do
    subject { described_class }

    context 'starts with 080' do
      let(:number) { '08012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts with 090' do
      let(:number) { '09012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts without 050' do
      let(:number) { '01012341234' }
      it { should_not be_acceptable(number) }
    end
  end

  describe '.new' do
    subject { described_class.new(number) }

    describe 'parts' do
      context 'starts with 080' do
        let(:number) { '08012345678' }
        its(:parts) { should == ['080', '123', '45678'] }
      end

      context 'starts with 090' do
        let(:number) { '09012345678' }
        its(:parts) { should == ['090', '123', '45678'] }
      end
    end

    describe 'carrier' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '090.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}12345" do
            let(:number) { "#{prefix}#{n}12345" }
            its(:carrier) { should == row[n] }
          end
        end
      end

      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '080.csv')
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
