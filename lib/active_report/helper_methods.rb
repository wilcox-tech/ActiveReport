require 'active_support/dependencies'

module ActiveReport
  module HelperMethods
    def self.make_a_model(model)
      @instance ||= ActiveSupport::Dependencies.constantize(model)
      @instance
    end
  end
end
