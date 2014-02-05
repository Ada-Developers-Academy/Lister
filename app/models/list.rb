class List < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :list_items
end
