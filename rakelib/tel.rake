# -*- coding: utf-8 -*-
namespace :tel do
  namespace :landline do
    desc 'output all area codes'
    task :all_area_codes do
      require 'rubygems'
      require 'spreadsheet'

      [
        '000124070.xls',
        '000124071.xls',
        '000124072.xls',
        '000124073.xls',
        '000124074.xls',
        '000124075.xls',
        '000124076.xls',
        '000124077.xls',
        '000124078.xls',
      ].each do |filename|
        book = Spreadsheet.open("doc/#{filename}", 'rb')
        sheet = book.worksheet(0)
        dict = {}
        skip = 2
        sheet.each do |row|
          next if (skip -= 1) >= 0
          dict[row[3].to_s] = true
        end
        puts dict.keys.sort.join("\n")
      end
    end
  end
end
