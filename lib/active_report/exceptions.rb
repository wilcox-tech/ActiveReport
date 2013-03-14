module ActiveReport
  module Exceptions
    class ReportNotFound < StandardError
      def initialize(report)
        @report = report
      end

      def message
        "ActiveReport checked #{Rails.root.join("app/reports")} for a report named #{@report}, and didn't find one."
      end
    end
  end
end
