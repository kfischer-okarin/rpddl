# frozen_string_literal: true

FactoryBot.define do
  factory :atom, class: Tensai::Pddl::Formula::Atom do
    predicate
    terms { predicate.variables.map { |var| [var.name, build(:entity)] }.to_h }

    initialize_with { new(predicate, terms) }
  end
end
