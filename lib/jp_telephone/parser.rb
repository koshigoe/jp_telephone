require 'jp_telephone/number'

module JpTelephone
  class ParserNotFound < StandardError; end

  class Parser
    def parse(number)
      normalized_number = normalize(number)
      unless type = detect_type_of(normalized_number)
        raise ParserNotFound, normalized_number
      end
      type.new(normalized_number)
    end

    protected
    def normalize(number)
      JpTelephone::Number.normalize(number)
    end

    def detect_type_of(normalized_number)
      JpTelephone::Number.all_types.detect{|t| t.acceptable? normalized_number }
    end
  end
end
