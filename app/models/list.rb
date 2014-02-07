class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :title, presence: true
  validates :user_id, presence: true
  validates :title, uniqueness: { scope: :user,
    message: "another of your lists has that title" }
end
