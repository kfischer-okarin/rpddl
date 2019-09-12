# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types/terms'
require 'tensai/pddl/formula/core'
require 'tensai/pddl/predicate'

module Tensai::Pddl
  module Formula
    # Atomic formula in a planning domain
    class Atom < Formula
      include Dry::Initializer.define -> do
        param :predicate, type: DataTypes::InstanceOf(Predicate)
        param :terms, type: DataTypes::Terms
      end

      def initialize(predicate, terms)
        super predicate, terms
        self.terms.freeze

        check_for_unknown_terms
        check_for_missing_terms
      end

      def variables
        terms.values.select { |term| term.is_a? Variable }
      end

      private

      def check_for_unknown_terms
        unknown_terms = terms.keys.reject { |k| predicate.variables.key?(k) }

        raise ArgumentError, "Unknown Terms: #{unknown_terms}" if unknown_terms.any?
      end

      def check_for_missing_terms
        missing_terms = predicate.variables.keys.reject { |k| terms.key?(k) }

        raise ArgumentError, "Missing Terms: #{missing_terms}" if missing_terms.any?
      end
    end
  end
end
