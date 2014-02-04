class Item < ActiveRecord::Base

  validates :name, :list_id, presence: true
  belongs_to :list

end
