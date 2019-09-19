# frozen_string_literal: true

require 'tensai/pddl/data_types/variable_list'

module Tensai::Pddl
  # Formula
  class Formula
    def implies(other)
      self.not.or other
    end

    private

    def initialize; end
  end
end
