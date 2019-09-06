# frozen_string_literal: true

FactoryBot.define do
  factory :variable, class: Tensai::Pddl::Variable do
    sequence(:name) { |n| "var_#{n}" }

    initialize_with { new(name) }
  end
end
