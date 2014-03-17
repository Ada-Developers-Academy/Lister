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
    title "Books"
    user_id 1
  end

  factory :item do
    name "David Copperfield"
    list_id 1
  end

end