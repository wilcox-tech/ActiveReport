require 'active_report/exceptions'

module ActiveReport
  class ReportsController < ApplicationController
    def index
      load_reports_from_rails
    end

    def show
      # Match to a report, and then show it in the specified format..
      report = raise_or_find_report_named params[:id]
      @report_contents = report.render

      # If the report accepts user input in some way, verify it's correct
      # or just ignore it (don't pass unfiltered input to a report, even
      # though theoretically it should handle it anyway.)
    end

    private
    def load_reports_from_rails
      # There has GOT to be a better way to do this..
      # require every report, so that ActiveReport::Base.descendants is full.
      Dir.glob(Rails.root.join("app/reports/*")).each do |x|
        require x
      end
    end

    def raise_or_find_report_named(report)
      load_reports_from_rails
      checks = [report, report.classify, "#{report}Report", "#{report.classify}Report"]
      valid_reports = ActiveReport::Base.descendants.map { |c| c.to_s }
      checks.each do |check|
        return check.constantize if valid_reports.include? check
      end
      raise ActiveReport::Exceptions::ReportNotFound.new(report) and return
    end
  end
end
