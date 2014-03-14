class Item < ActiveRecord::Base
  validates :name, presence: true #allow_blank: false
  validates :name, format: { with: /\w+/}
  belongs_to :list
end
