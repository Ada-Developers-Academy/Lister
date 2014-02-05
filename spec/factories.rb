FactoryGirl.define do
  factory :user do
    password "Gogo1234"
    password_confirmation "Gogo1234"
    id 1
    sequence :username do |n| 
      "User #{n}" 
    end
    
    sequence :email do |n| 
      "#{n}@example.com"
    end
  end

  factory :list do
    title 'Cool Stuff'
    description 'This is a list of things'
    user_id 1
  end

  factory :list1, class: List do
    title 'Cool Stuff1'
    description 'This is a list of things'
    user_id 1
  end

  factory :list2, class: List do
    title 'Cool Stuff2'
    description 'This is a list of things'
    user_id 2
  end

  factory :list_item do
    description 'I am a thing that is cool.'
    list_id 1
  end
end