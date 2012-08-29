require 'nkf'

module JpTelephone
  module Number
    def self.normalize(number)
      NKF.nkf('-m0Z1 -w', number).gsub(/[^0-9]/, '')
    end

    def self.all_types
      self.constants.select{|x| x < self::Base }
    end
  end
end
