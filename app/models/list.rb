class List < ActiveRecord::Base
  validates :list_name, presence: true
  validates :list_name, length: {minimum: 1, message: "you must enter a list name with at least 1 character"}
  has_many :items
  belongs_to :user
end
