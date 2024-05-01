FactoryBot.define do
    factory :gear do
        name {"burton"}
        gear_type {0}
        text {"test123400"}
        association :brand
    end
end