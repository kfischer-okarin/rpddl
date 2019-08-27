# frozen_string_literal: true

require 'set'
require 'dry-initializer'

require 'ruby_pddl/data_types'
require 'ruby_pddl/data_types/terms'
require 'ruby_pddl/predicate'

module RubyPddl
  # Atomic formula in a planning domain
  class AtomicFormula
    include Dry::Initializer.define -> do
      param :predicate, type: DataTypes::InstanceOf(Predicate)
      param :terms, type: DataTypes::Terms
    end

    def initialize(predicate, terms)
      super predicate, terms

      raise ArgumentError, 'Unknown Terms' if terms.keys.any? { |k| !predicate.variables.key?(k) }

      predicate.variables.each do |var|
        self.terms[var.name] = var unless terms.key? var.name
      end
      self.terms.freeze
    end

    def bind(values)
      AtomicFormula.new(predicate, terms.merge(values))
    end
  end
end
