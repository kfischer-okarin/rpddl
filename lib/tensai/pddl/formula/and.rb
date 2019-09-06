# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types'

module Tensai::Pddl
  module Formula
    # Conjunction
    class And < Formula
      include Dry::Initializer.define -> do
        param :formulas, type: DataTypes::FilledArrayOf(Formula)
      end

      def initialize(*formulas)
        super(formulas)
      end

      def and(other)
        And.new(*formulas, other)
      end

      def variables
        formulas.map(&:variables).flatten
      end
    end
  end
end
