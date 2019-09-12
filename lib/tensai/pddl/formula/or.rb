# frozen_string_literal: true

require 'dry-initializer'

module Tensai::Pddl
  module Formula
    # Disjunction
    class Or < Formula
      include Dry::Initializer.define -> do
        param :formulas, type: DataTypes::FilledArrayOf(Formula)
      end

      def initialize(*formulas)
        super(formulas)
      end

      def or(other)
        Or.new(*formulas, other)
      end

      def variables
        formulas.map(&:variables).flatten
      end
    end
  end
end
