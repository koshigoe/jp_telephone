# -*- coding: utf-8 -*-
require 'spec_helper'
require 'jp_telephone/parser'

describe JpTelephone::Parser do
  describe '#parse' do
    context 'type of telephone number is unknown' do
      it 'should raise JpTelephone::ParserNotFound' do
        expect {
          JpTelephone::Parser.new.parse('０１２３４５６７８９')
        }.to raise_error(JpTelephone::ParserNotFound, '0123456789')
      end
    end
  end
end
