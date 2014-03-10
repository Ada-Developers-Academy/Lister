class List < ActiveRecord::Base
  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user, message: "you've already got a list with that title" }
  belongs_to :user
  has_many :items
end
