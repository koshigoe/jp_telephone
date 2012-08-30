# -*- coding: utf-8 -*-
require 'spec_helper'
require 'csv'
require 'jp_telephone/number'

describe JpTelephone::Number::FreeDial do
  describe '.acceptable?' do
    subject { described_class }

    context 'starts with 0120' do
      let(:number) { '0120123123' }
      it { should be_acceptable(number) }
    end

    context 'starts with 0800' do
      let(:number) { '08001231234' }
      it { should be_acceptable(number) }
    end

    context 'starts without 0120/0800' do
      let(:number) { '01012341234' }
      it { should_not be_acceptable(number) }
    end
  end

  describe '.new' do
    subject { described_class.new(number) }

    describe 'parts' do
      context 'starts with 0120' do
        let(:number) { '0120123123' }
        its(:parts) { should == ['0120', '123', '123'] }
      end

      context 'starts with 0800' do
        let(:number) { '08001231234' }
        its(:parts) { should == ['0800', '123', '1234'] }
      end
    end

    describe 'carrier' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '0120.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}123" do
            let(:number) { "#{prefix}#{n}123" }
            its(:carrier) { should == row[n] }
          end
        end
      end

      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '0800.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}1234" do
            let(:number) { "#{prefix}#{n}1234" }
            its(:carrier) { should == row[n] }
          end
        end
      end
    end
  end
end
