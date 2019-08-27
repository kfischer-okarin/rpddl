# frozen_string_literal: true

require_relative '../spec_helper'

module RubyPddl
  RSpec.describe AtomicFormula do
    describe 'Validation' do
      subject { AtomicFormula.new(predicate, terms) }

      let(:predicate) { Predicate.new('adjacent', variables: [Variable.new('a'), Variable.new('b')]) }

      VALID_TERMS = [
        { 'a' => Entity.new('dock1'), 'b' => Entity.new('dock2') },
        { 'a' => Variable.new('left'), 'b' => Variable.new('right') },
        { 'a' => Entity.new('robot_a'), 'b' => Variable.new('neighbor') }
      ].freeze

      VALID_TERMS.each do |terms|
        context "Assigning #{terms}" do
          let(:terms) { terms }

          it 'can be assigned' do
            expect(subject).to have_attributes terms: terms
          end
        end
      end

      context 'Assigning just partially' do
        let(:terms) { { 'a' => Entity.new('dock1') } }

        it 'keeps the original variables where unassigned' do
          expected_terms = { 'b' => predicate.variables['b'] }.merge(terms)
          expect(subject).to have_attributes terms: expected_terms
        end
      end

      INVALID_TERMS = [
        { 'c' => Variable.new('left') }
      ].freeze

      INVALID_TERMS.each do |terms|
        context "Assigning #{terms}" do
          let(:terms) { terms }

          it 'cannot be assigned' do
            expect { subject }.to raise_error ArgumentError
          end
        end
      end
    end

    describe '#bind' do
      subject { formula.bind(values) }

      let(:formula) { AtomicFormula.new(predicate, terms) }
      let(:predicate) { Predicate.new('adjacent', variables: [Variable.new('a'), Variable.new('b')]) }
      let(:terms) { { 'a' => Variable.new('x'), 'b' => Entity.new('one') } }

      shared_examples 'creates a new formula with the bound value' do
        it 'creates a new formula' do
          expect(subject).to be_a AtomicFormula
          expect(subject).not_to be formula
        end

        it 'does not change the original formula' do
          expect { subject }.not_to(change { formula.terms.to_a })
        end

        it 'bind the specified variable' do
          expect(subject.terms).to eq('a' => values['a'], 'b' => terms['b'])
        end
      end

      context 'binding a variable to an Entity' do
        let(:values) { { 'a' => Entity.new('two') } }

        include_examples 'creates a new formula with the bound value'
      end

      context 'binding a variable to another Variable' do
        let(:values) { { 'a' => Variable.new('z') } }

        include_examples 'creates a new formula with the bound value'
      end

      context 'binding a variable to an invalid value' do
        let(:values) { { 'a' => 11 } }

        it 'raises an error' do
          expect { subject }.to raise_error Dry::Types::CoercionError
        end
      end
    end
  end
end
