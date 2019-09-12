# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

module Tensai::Pddl
  module Formula
    # Conjunction
    class And < Formula
      include Dry::Equalizer(:formulas)
      include Dry::Initializer.define -> do
        param :formulas, type: DataTypes::FilledSetOf(Formula)
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
