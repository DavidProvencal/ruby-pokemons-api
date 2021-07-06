FactoryBot.define do
  sequence :name do |n|
    "Pokemon_#{n}"
  end

  factory :pokemon do
    number { 123 }
    name
    type_1 { "Type 1 test" }
    type_2 { "Type 2 test" }
    total { 999 }
    hp { 10 }
    attack { 20 }
    defense { 30 }
    sp_atk { 40 }
    sp_def { 50 }
    speed { 60 }
    generation { 1 }
    legendary { true }
  end
end
