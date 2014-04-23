module JobUp
  VERSION='0.0.1'

  module JobMailer

    SUBCATEGORIES=[ 147, 199, 13, 194, 197, 42, 71, 195, 1, 72, 198, 193, 88, 196 ]
    CANTONS=[ "GE1", "GE2", "GE3", "VD1", "GE" ]
    KEYWORDS=[ "UNIX", "Linux", "Unix", "linux", "system+admin", "monitoring", "puppet", "nagios"]
    EMPLOYMENT=[ "PERMANENT", "LIMITED", "FREELANCE" ]

    COMPANYTYPES_AGENCIES_ONLY = 0
    COMPANYTYPES_ENTERPRISE_ONLY = 1
    COMPANYTYPES=[ COMPANYTYPES_AGENCIES_ONLY, COMPANYTYPES_ENTERPRISE_ONLY ]

    class Criteria
      def initialize()
        @options ||= {}
        @subcategories=SUBCATEGORIES.join(",")
        @cantons=CANTONS.join(",")
      end

      def build_query_string
        return @query_string
      end

    end
  end

end
