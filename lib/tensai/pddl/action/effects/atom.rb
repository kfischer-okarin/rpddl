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
      end
    end
  end
end
