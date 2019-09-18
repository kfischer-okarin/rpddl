# frozen_string_literal: true

FactoryBot.define do
  factory :effect, class: Tensai::Pddl::Action::Effects::Atom do
    formula { build(:atom) }

    initialize_with { new(formula) }
  end
end
