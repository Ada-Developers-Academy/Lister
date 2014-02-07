class Item < ActiveRecord::Base
  belongs_to :list
  validates :content, presence: true
  validates :list_id, presence: true
  validates :content, uniqueness: { scope: :list,
  message: "that item is already on the list" }
end
