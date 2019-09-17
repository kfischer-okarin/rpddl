# frozen_string_literal: true

require 'tensai/pddl/data_types/conjunction'

module Tensai::Pddl
  module Action
    # STRIPS-style action
    class Strips < Adl
      option :precondition, type: DataTypes::PositiveConjunction, optional: true
    end
  end
end
