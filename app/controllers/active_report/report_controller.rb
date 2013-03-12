module ActiveReport
  class ReportController < ApplicationController
    def index
      # Find all the reports in the app..
    end

    def show
      # Match to a report, and then show it in the specified format..

      # If the report accepts user input in some way, verify it's correct
      # or just ignore it (don't pass unfiltered input to a report, even
      # though theoretically it should handle it anyway.)
    end
  end
end
