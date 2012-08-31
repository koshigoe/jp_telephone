# -*- coding: utf-8 -*-
require 'spec_helper'
require 'csv'
require 'jp_telephone/number'

describe JpTelephone::Number::Business do
  describe '.acceptable?' do
    subject { described_class }

    context 'starts with 00' do
      let(:number) { '00105012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts with 002' do
      let(:number) { '002005012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts with 0091' do
      let(:number) { '00912005012341234' }
      it { should be_acceptable(number) }
    end

    context 'starts without 00' do
      let(:number) { '09012341234' }
      it { should_not be_acceptable(number) }
    end
  end

  describe '.new' do
    subject { described_class.new(number) }

    describe 'parts' do
      let(:number) { '00105012345678' }
      its(:parts) { should == ['001', '050', '1234', '5678'] }
      its(:number) { should be_an_instance_of JpTelephone::Number::VoIP }
    end

    describe 'carrier' do
      context '00105012341234' do
        let(:number) { "00105012341234" }
        its(:carrier) { should == 'ＫＤＤＩ' }
        its(:number) { should be_an_instance_of JpTelephone::Number::VoIP }
      end

      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '00.csv')
      skip = 1
      CSV.foreach(path) do |row|
        next if skip > 0
        skip -= 1
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}05012341234" do
            let(:number) { "#{prefix}#{n}05012341234" }
            its(:carrier) { should == row[n] }
          end
        end
      end

      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '002.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}05012341234" do
            let(:number) { "#{prefix}#{n}05012341234" }
            its(:carrier) { should == row[n] }
          end
        end
      end

      path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'number', '009.csv')
      CSV.foreach(path) do |row|
        prefix = row.shift
        0.upto(9) do |n|
          context "#{prefix}#{n}05012341234" do
            let(:number) { "#{prefix}#{n}05012341234" }
            its(:carrier) { should == row[n] }
          end
        end
      end
    end
  end
end
