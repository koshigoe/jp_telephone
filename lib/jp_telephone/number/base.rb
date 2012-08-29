module JpTelephone
  module Number
    class Base
      def self.accept?(normalized_number)
        raise NotImplementedError
      end

      def initialize(number)
      end
    end
  end
end
