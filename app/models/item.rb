class Item < ActiveRecord::Base
  validates :name, :list_id, presence: true
  validates :name, uniqueness: { scope: :list, message: "you've already got that item" }
  belongs_to :list
end
