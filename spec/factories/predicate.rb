# frozen_string_literal: true

FactoryBot.define do
  factory :predicate, class: Tensai::Pddl::Predicate do
    sequence(:name) { |n| "predicate_#{n}" }
    variables { build_list(:variable, 2) }

    initialize_with { new(name, variables: variables) }
  end
end
