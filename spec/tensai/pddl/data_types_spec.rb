# frozen_string_literal: true

require_relative '../../spec_helper'

module Tensai::Pddl
  RSpec.describe DataTypes do
    shared_examples 'it accepts' do |value|
      it "accepts #{value}" do
        expect { subject[value] }.not_to raise_error
      end
    end

    shared_examples 'it does not accept' do |value|
      it "does not accept #{value}" do
        expect { subject[value] }.to raise_error Dry::Types::CoercionError
      end
    end

    describe '::VariableList' do
      subject { DataTypes::VariableList }

      include_examples 'it accepts', FactoryBot.build_list(:variable, 1)
      include_examples 'it accepts', FactoryBot.build_list(:variable, 2)
      include_examples 'it does not accept', []
      include_examples 'it does not accept', FactoryBot.build(:variable)
    end

    describe '::Literal' do
      subject { DataTypes::Literal }

      include_examples 'it accepts', FactoryBot.build(:atom)
      include_examples 'it accepts', FactoryBot.build(:atom).not
      include_examples 'it does not accept', 'abc'
    end

    describe '::PositiveConjunction' do
      subject { DataTypes::PositiveConjunction }

      include_examples 'it accepts', FactoryBot.build(:atom)
      include_examples 'it accepts', FactoryBot.build(:atom).and(FactoryBot.build(:atom))
      include_examples 'it does not accept', FactoryBot.build(:atom).not
      include_examples 'it does not accept', FactoryBot.build(:atom).and(FactoryBot.build(:atom).not)
      include_examples 'it does not accept', 'not a formula'
    end

    describe '::Conjunction' do
      subject { DataTypes::Conjunction }

      include_examples 'it accepts', FactoryBot.build(:atom)
      include_examples 'it accepts', FactoryBot.build(:atom).and(FactoryBot.build(:atom))
      include_examples 'it accepts', FactoryBot.build(:atom).not
      include_examples 'it accepts', FactoryBot.build(:atom).and(FactoryBot.build(:atom).not)
      include_examples 'it does not accept', FactoryBot.build(:atom).and(FactoryBot.build(:atom)).not
      include_examples 'it does not accept', 'not a formula'
    end

    describe '::FilledSetOf(string)' do
      subject { DataTypes::FilledSetOf(String) }

      include_examples 'it accepts', ['a']
      include_examples 'it accepts', Set.new(%w[a b])
      include_examples 'it does not accept', [4]
      include_examples 'it does not accept', 22
    end
  end
end
