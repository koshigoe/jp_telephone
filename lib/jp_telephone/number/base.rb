module JpTelephone
  module Number
    class Base
      def self.acceptable?(normalized_number)
        raise NotImplementedError
      end

      def initialize(normalized_number)
        @parts = []
        parse(normalized_number)
      end

      attr_reader :parts

      # TODO: format
      def to_s
        @parts.join('-')
      end

      def to_a
        @parts
      end

      protected
      def parse(normalized_number)
        raise NotImplementedError
      end
    end
  end
end
