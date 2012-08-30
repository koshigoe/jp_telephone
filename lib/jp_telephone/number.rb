require 'nkf'

module JpTelephone
  module Number
    autoload :Base, 'jp_telephone/number/base'
    autoload :IP, 'jp_telephone/number/ip'
    autoload :Mobile, 'jp_telephone/number/mobile'
    autoload :PHS, 'jp_telephone/number/phs'
    autoload :PocketBell, 'jp_telephone/number/pocket_bell'
    autoload :FreeDial, 'jp_telephone/number/free_dial'

    def self.normalize(number)
      NKF.nkf('-m0Z1 -w', number).gsub(/[^0-9]/, '')
    end

    def self.all_types
      self.constants.inject([]) do |res, name|
        begin
          if (type = self.const_get(name)) < self::Base
            res << type
          end
        rescue NameError
        end
        res
      end
    end
  end
end
