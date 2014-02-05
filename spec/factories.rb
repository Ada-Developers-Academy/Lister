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
    name "dogs"
    user_id 4
  end

  factory :item do
    description "milk"
    :list #sets list_id to factory of :list above
  end
end