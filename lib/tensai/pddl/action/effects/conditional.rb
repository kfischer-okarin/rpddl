# frozen_string_literal: true

require 'dry-initializer'

require 'tensai/pddl/data_types/literal'
require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  module Action
    module Effects
      # Effect that is applied when the specified condition applies
      class Conditional < Effect
        include Dry::Initializer.define -> do
          param :condition, type: DataTypes::InstanceOf(Formula)
          param :effect, type: DataTypes::InstanceOf(Effect)
        end
      end
    end
  end
end
