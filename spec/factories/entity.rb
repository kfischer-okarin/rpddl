# frozen_string_literal: true

FactoryBot.define do
  factory :entity, class: Tensai::Pddl::Entity do
    sequence(:name) { |n| "entity_#{n}" }

    initialize_with { new(name) }
  end
end
