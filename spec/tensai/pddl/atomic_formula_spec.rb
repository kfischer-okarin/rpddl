# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
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
  end
end
