# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

module Tensai::Pddl
  module Formula
    # Disjunction
    class Or < Formula
      include Dry::Equalizer(:formulas)
      include Dry::Initializer.define -> do
        param :formulas, type: DataTypes::FilledSetOf(Formula)
      end

      def initialize(*formulas)
        super(formulas)
      end

      def or(other)
        Or.new(*formulas, other)
      end

      def free_variables
        formulas.map(&:free_variables).flatten
      end
    end
  end
end
