class Item < ActiveRecord::Base
  validates :name, :list_id, presence: true
end
