# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types/literal'

module Tensai::Pddl
  module Action
    module Effects
      # Atomic effect
      class Atom < Effect
        include Dry::Initializer.define -> do
          param :formula, type: DataTypes::Literal
        end

        def free_variables
          formula.free_variables
        end
      end
    end
  end
end
