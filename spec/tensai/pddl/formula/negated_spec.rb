# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula::Negated do
    describe '#free_variables' do
      subject { formula.free_variables }

      let(:formula) { build(:atom, predicate: predicate, terms: terms).not }
      let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }
      let(:terms) { { a: build(:variable), b: build(:entity) } }

      it 'contains all variables' do
        expect(subject).to contain_exactly(terms[:a])
      end
    end
  end
end
