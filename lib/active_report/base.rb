require 'active_report/column'

module ActiveReport
  class Base
    class << self
      @@model = nil
      @@joins = []
      @@columns = []
      @@sorts = {}
      @@scopes = {}

      # Defines the model on which this report shows data from.
      def reports_on(model)
        @@model = model.to_s.classify
      end

      def join_on(*models)
        @@joins << models
      end

      def scope_for(model, scope)
        @@scopes[model] = scope
      end

      # not sure if should support multiple sorts on a single model.
      # for now, KISS.
      def sort_on(model, property)
        @@sorts[model] = property
      end

      def column(model, property, options = {})
        @@columns << Column.new(model, property, options)
      end

      def render
        @@columns.each do |column|
          puts "#{column.name}: #{column.retrieve_value_counts}"
        end
      end
    end
  end
end
