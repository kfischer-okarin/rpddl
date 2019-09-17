# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  module Action
    RSpec.describe Strips do
      describe '#name' do
        subject { Strips.new(name, parameters: build_list(:variable, 1), effects: [build(:effect)]) }

        it_behaves_like 'a named object'
      end

      describe '#parameters' do
        subject { Strips.new('action', parameters: variables, effects: [build(:effect)]) }

        it_behaves_like 'a object containing variables', :parameters
      end

      shared_examples 'value is accepted' do
        it 'is accepted' do
          expect { subject }.not_to raise_error
        end
      end

      shared_examples 'value is not accepted' do
        it 'is not accepted' do
          expect { subject }.to raise_error ArgumentError
        end
      end

      shared_examples 'accepts entities and known variables' do
        context 'containing entity' do
          let(:term) { build(:entity) }

          include_examples 'value is accepted'
        end

        context 'containing parameter variable' do
          let(:term) { parameter }

          include_examples 'value is accepted'
        end

        context 'containing an unknown variable' do
          let(:term) { build(:variable) }

          include_examples 'value is not accepted'
        end
      end

      describe '#precondition' do
        subject { Strips.new('action', parameters: [parameter], precondition: precondition, effects: [build(:effect)]) }

        let(:parameter) { build(:variable) }
        let(:predicate) { build(:predicate, :with_variable_names, variable_names: [:a]) }

        context 'atom' do
          let(:precondition) { build(:atom, predicate: predicate, terms: { a: term }) }

          include_examples 'accepts entities and known variables'
        end

        context 'conjunction' do
          let(:precondition) {
            Formula::And.new(
              build(:atom, predicate: predicate, terms: { a: build(:entity) }),
              build(:atom, predicate: predicate, terms: { a: parameter }),
              build(:atom, predicate: predicate, terms: { a: term })
            )
          }

          include_examples 'accepts entities and known variables'
        end
      end

      describe '#effect' do
        subject { Strips.new('action', parameters: [parameter], effects: effects) }

        let(:parameter) { build(:variable) }
        let(:predicate) { build(:predicate, :with_variable_names, variable_names: [:a]) }

        context 'single atomic effect' do
          let(:effects) {
            [
              build(:effect, formula: build(:atom, predicate: predicate, terms: { a: term }))
            ]
          }

          include_examples 'accepts entities and known variables'
        end

        context 'multiple effects' do
          let(:effects) {
            [
              build(:effect, formula: build(:atom, predicate: predicate, terms: { a: build(:entity) })),
              build(:effect, formula: build(:atom, predicate: predicate, terms: { a: parameter })),
              build(:effect, formula: build(:atom, predicate: predicate, terms: { a: term }))
            ]
          }

          include_examples 'accepts entities and known variables'
        end
      end
    end
  end
end
