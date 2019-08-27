# frozen_string_literal: true

require 'dry-types'

module Tensai::Pddl
  # Types for argument validations
  module DataTypes
    # Base Types from dry-types
    module Base
      include Dry.Types()
    end
  end
end
