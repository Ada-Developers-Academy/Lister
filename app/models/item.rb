class Item < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
  validates :name, length: { minimum: 1, message: "you must enter a list name with at least 1 character"}
end
