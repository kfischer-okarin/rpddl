# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula::ThereExists do
    subject { Formula::ThereExists.new(variables, formula) }

    it_behaves_like 'a formula with bound variables'
  end
end
