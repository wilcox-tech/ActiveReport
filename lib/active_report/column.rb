require 'active_report/helper_methods'

module ActiveReport
  class Column
    def initialize(model, prop, options)
      @model = model.to_s.classify
      @model_instance = HelperMethods.make_a_model(@model)
      @model_column = prop
      @options = options
    end

    def name
      "#{@model.to_s.humanize}:#{@model_column.to_s.humanize}"
    end

    def retrieve_values
      @model_instance.pluck(@model_column.to_sym)
    end

    def retrieve_value_counts
      values = @model_instance.pluck(@model_column.to_sym).to_a
      values.uniq.map { |val| [val, values.count(val)] }
    end

    def wants_colour?
      @options.fetch :colourise, false
    end

    def value_range
      @options.fetch :value_range, (1..100)
    end
  end
end
