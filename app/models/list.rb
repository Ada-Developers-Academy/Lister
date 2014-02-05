class List < ActiveRecord::Base
  validates :list_name, presence: true
end
