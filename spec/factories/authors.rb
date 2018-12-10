FactoryBot.define do
  factory :author do
    first_name      { FFaker::Name.first_name }
    last_name       { FFaker::Name.last_name }
    biography       { FFaker::Book.description }
    birth_date      { FFaker::Time.between(250.years.ago, 16.years.ago)	 }
    death_date      { nil }
  end

  trait :with_images do
    transient do
      count { 1 }
    end

    after(:create) do |author, evaluator|
      create_list :image, evaluator.count, author: author
    end
  end
end
