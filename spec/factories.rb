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
    sequence :title do |n| 
      "List #{n}" 
    end
    
    sequence :user_id do |n| 
      n
    end
  end

  factory :item do 
    sequence :content do |n| 
    "Item #{n}"     
  end
    
    sequence :list_id do |n| 
      n
    end
  end 
end