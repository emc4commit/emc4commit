FactoryGirl.define do
  factory :project do
    url "MyString"
    full_name "test/test"
    github_id "1234567890"
    emercoin_address "emercoin_address"

    trait :github do
      host 'github'
    end

    trait :bitbucket do
      host 'bitbucket'
    end
  end
end
