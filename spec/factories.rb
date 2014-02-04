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
    name "My Listy List"
    user_id 1
  end

  factory :item1 do
    name "The Spanish Inquisition"
    list_id 1
  end

  factory :item2 do
    name "Fate-free yogurt"
    list_id 1
  end
end