# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formulas::Atom do
    describe '#terms' do
      let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }

      shared_examples 'it accepts' do |terms|
        it "accepts #{terms}" do
          expect { build(:atom, predicate: predicate, terms: terms) }.not_to raise_error
        end
      end

      shared_examples 'it does not accept' do |terms|
        it "does not accept #{terms}" do
          expect { build(:atom, predicate: predicate, terms: terms) }.to raise_error ArgumentError
        end
      end

      include_examples 'it accepts', 'a' => Entity.new('dock1'), 'b' => Entity.new('dock2')
      include_examples 'it accepts', 'a' => Variable.new('left'), 'b' => Variable.new('right')
      include_examples 'it accepts', 'a' => Entity.new('robot_a'), 'b' => Variable.new('neighbor')
      include_examples 'it does not accept', 'a' => Entity.new('dock1')
      include_examples 'it does not accept', 'c' => Variable.new('left')
    end

    describe '#free_variables' do
      subject { atom.free_variables }

      let(:atom) { build(:atom, predicate: predicate, terms: terms) }
      let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }
      let(:terms) { { a: build(:variable), b: build(:entity) } }

      it 'contains all variables' do
        expect(subject).to contain_exactly(terms[:a])
      end
    end
  end
end
