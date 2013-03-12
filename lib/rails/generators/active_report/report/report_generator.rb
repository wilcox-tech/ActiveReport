require 'rails/generators/named_base'

module ActiveReport
  module Generators
    class ReportGenerator < Rails::Generators::NamedBase
      desc "Creates a new report with the specified name and (optionally) the models to report on."
      source_root File.expand_path("../templates", __FILE__)

      argument :reports_on, :type => :array, :default => []

      def create_report_file
        template 'report.rb', File.join('app/reports', class_path, "#{file_name}.rb")
      end
    end
  end
end
