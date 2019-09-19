# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

module Tensai::Pddl
  module Formulas
    # Set of formulas. Parent class of And/Or
    class Set < Formula
      include Dry::Equalizer(:formulas)
      extend Dry::Initializer

      param :formulas, type: DataTypes::FilledSetOf(Formula)

      def initialize(*formulas)
        super(formulas)
      end

      def free_variables
        formulas.map(&:free_variables).flatten
      end
    end
  end
end
