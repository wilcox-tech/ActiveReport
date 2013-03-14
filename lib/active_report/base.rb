require 'active_report/helper_methods'
require 'active_report/column'

module ActiveReport
  class Base

    class << self
      @@joins = []
      @@columns = []
      @@sorts = {}
      @@scopes = {}

      # Defines the model on which this report shows data from.
      def reports_on(model)
        @@model = model.to_s.classify
      end

      def join_with(*models)
        @@joins << models
      end

      def group_on(model, property)
        @@group = Column.new(model, property, nil)
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
        model = HelperMethods.make_a_model(@@model)
        orders = @@sorts.map { |model, prop| "#{model}.#{prop}" }
        data = model.joins(@@joins).order(orders)
        result = { :groups => [] }
        if !@@group.nil?
          group_values = @@group.retrieve_value_counts(data)
          group_values.each do |grouping, count|
            group = {}
            group[:name] = grouping
            group[:count] = count
            group[:column_defs] = cols = @@columns.map { |c| c.model_column }
            group[:rows] = data.select(cols)
            result[:groups] << group
          end
        else
          group = {}
          group[:name] = "All"
          group[:column_defs] = cols = @@columns.map { |c| c.model_column }
          group[:rows] = d = data.select(cols)
          group[:count] = d.count
          result[:groups] << group
        end
        result
      end
    end

  end
end
