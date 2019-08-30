# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types'

module Tensai::Pddl
  module Formula
    # Conjunction
    class And < Formula
      include Dry::Initializer.define -> do
        param :formulas, type: DataTypes::Base::Array.of(DataTypes::InstanceOf(Formula))
      end

      def and(other)
        And.new([*formulas, other])
      end
    end
  end
end
