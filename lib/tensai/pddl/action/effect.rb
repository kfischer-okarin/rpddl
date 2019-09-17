# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types/literal'

module Tensai::Pddl
  module Action
    # Action effect
    class Effect
      extend Dry::Initializer

      param :formula, type: DataTypes::Literal
    end
  end
end
