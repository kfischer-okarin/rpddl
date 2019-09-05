# frozen_string_literal: true

require_relative '../../../spec_helper'

module Tensai::Pddl
  RSpec.describe Formula::Formula do
    let(:predicate) { Predicate.new('adjacent', variables: [Variable.new('a'), Variable.new('b')]) }
    let(:formula) { Formula::Atom.new(predicate, 'a' => Entity.new('alice'), 'b' => Entity.new('bob')) }

    describe '#not' do
      subject { formula.not }

      it 'returns a negated formula' do
        expect(subject).to be_a Formula::Negated
        expect(subject.formula).to equal formula
      end

      it 'returns the original formula when negated' do
        expect(subject.not).to equal formula
      end
    end

    describe '#and' do
      let(:formula_2) { Formula::Atom.new(predicate, 'a' => Entity.new('carl'), 'b' => Entity.new('deacon')) }
      let(:formula_3) { Formula::Atom.new(predicate, 'a' => Entity.new('emma'), 'b' => Entity.new('fred')) }

      context 'two formulas' do
        subject { formula.and formula_2 }

        it 'returns a and conjunction of both formulas' do
          expect(subject).to be_a Formula::And
          expect(subject.formulas).to contain_exactly(formula, formula_2)
        end
      end

      context 'a conjunction and a formula' do
        subject { formula.and(formula_2).and(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formula::And
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end

      context 'a formula and a conjunction' do
        subject { formula.and formula_2.and(formula_3) }

        it 'returns a and conjunction of all formulas' do
          expect(subject).to be_a Formula::And
          expect(subject.formulas).to contain_exactly(formula, formula_2, formula_3)
        end
      end
    end
  end
end
