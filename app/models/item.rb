class Item < ActiveRecord::Base
  validates :itemname, presence: true
  validates :list_id, presence: true 
  belongs_to :list
end
