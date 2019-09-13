# frozen_string_literal: true

require 'dry-equalizer'
require 'dry-initializer'

module Tensai::Pddl
  module Formula
    # Negated formula
    class Negated < Formula
      include Dry::Equalizer(:formula)
      include Dry::Initializer.define -> do
        param :formula, type: DataTypes::InstanceOf(Formula)
      end

      def not
        formula
      end

      def free_variables
        formula.free_variables
      end
    end
  end
end
