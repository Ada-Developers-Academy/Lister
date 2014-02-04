FactoryGirl.define do
  factory :user do
    password "Gogo1234"
    password_confirmation "Gogo1234"
    sequence :username do |n|
      "User #{n}"
    end

    sequence :email do |n|
      "#{n}@example.com"
    end
  end

  factory :list do
    name "Test List"
    user_id 1
  end

  factory :item1 do
    name "Barf"
    list_id 1
  end

  factory :item2 do
    name "Bag"
    list_id 1
  end
end
