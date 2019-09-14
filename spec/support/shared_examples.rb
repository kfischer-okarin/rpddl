# frozen_string_literal: true

module Tensai::Pddl
  RSpec.shared_examples 'a named object' do
    context 'with a valid name' do
      let(:name) { 'valid-object' }

      it 'has the specified name' do
        expect(subject).to have_attributes(name: name)
      end
    end

    context 'with a invalid name' do
      let(:name) { 'invalidName$$$' }

      it 'throws an error' do
        expect { subject }.to raise_error Dry::Types::CoercionError
      end
    end
  end

  RSpec.shared_examples 'a object containing variables' do |attribute = :variables|
    context 'with one variable' do
      let(:variables) { build_list(:variable, 1) }

      it 'has the specified variables' do
        expect(subject.send(attribute)).to contain_exactly(*variables)
      end
    end

    context 'with several variable' do
      let(:variables) { build_list(:variable, 2) }

      it 'has the specified variables' do
        expect(subject.send(attribute)).to contain_exactly(*variables)
      end
    end

    context 'with a non-variable' do
      let(:variables) { ['not-a-variable'] }

      it 'throws an error' do
        expect { subject }.to raise_error Dry::Types::CoercionError
      end
    end
  end

  RSpec.shared_examples 'a set of formulas' do
    describe '#free_variables' do
      let(:formulas) {
        [
          build(:atom, predicate: predicate, terms: { a: build(:variable), b: build(:entity) }),
          build(:atom, predicate: predicate, terms: { a: build(:entity), b: build(:variable) })
        ]
      }

      let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }

      it 'contains all variables' do
        expect(subject.free_variables).to contain_exactly(formulas[0].terms['a'], formulas[1].terms['b'])
      end
    end
  end

  RSpec.shared_examples 'a formula with bound variables' do
    let(:variables) { [build(:variable)] }
    let(:predicate) { build(:predicate, :with_variable_names, variable_names: %w[a b]) }

    context 'when not using the bound variables' do
      let(:formula) {
        build(:atom, predicate: predicate, terms: { a: build(:entity), b: build(:entity) })
      }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    describe '#free_variables' do
      let(:formula) {
        build(:atom, predicate: predicate, terms: { a: variables[0], b: build(:variable) })
      }

      it 'contains all free variables' do
        expect(subject.free_variables).to contain_exactly(formula.terms['b'])
      end
    end
  end
end
