# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula::Or do
    describe '#free_variables' do
      subject { (atom_a.or atom_b).free_variables }

      let(:atom_a) { build(:atom, predicate: predicate, terms: { a: build(:variable), b: build(:entity) }) }
      let(:atom_b) { build(:atom, predicate: predicate, terms: { a: build(:entity), b: build(:variable) }) }
      let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }

      it 'contains all variables' do
        expect(subject).to contain_exactly(atom_a.terms['a'], atom_b.terms['b'])
      end
    end
  end
end
