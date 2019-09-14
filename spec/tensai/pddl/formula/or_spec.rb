# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula::Or do
    it_behaves_like 'a set of formulas' do
      subject { Formula::Or.new(*formulas) }
    end
  end
end
