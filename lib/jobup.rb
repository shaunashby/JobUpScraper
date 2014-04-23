module JobUp
  VERSION='0.0.1'

  module JobMailer
    SUBCATEGORIES=[]
    CANTONS=[]
    KEYWORDS=[]
    EMPLOYMENT=[]
    COMPANYTYPES={ AGENCIES_ONLY => 0, ENTERPRISE_ONLY => 1,}

    class Criteria
      def initialize()
        @options ||= {}
        @query_string = "a/b/c/d"
      end

      def build_query_string
        return @query_string
      end

    end
  end

end
