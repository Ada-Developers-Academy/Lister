class List < ActiveRecord::Base
  validates :list_name, presence: true
  validates :list_name, length: {minimum: 1}
  has_many :items
  belongs_to :user
end
