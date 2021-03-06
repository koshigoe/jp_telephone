# -*- coding: utf-8 -*-
require 'spec_helper'
require 'csv'
require 'jp_telephone/number'

describe JpTelephone::Number::VoIP do
  describe '.acceptable?' do
    subject { described_class }

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
    subject { described_class.new(number) }

    describe 'parts' do
      let(:number) { '05012345678' }
      its(:parts) { should == ['050', '1234', '5678'] }
    end

    describe 'carrier' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '050.csv')
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
