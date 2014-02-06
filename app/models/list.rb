class List < ActiveRecord::Base

  attr_accessor :item_name
  before_save :add_item

  validates :name, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :items

  private

  def add_item
    if self.item_name
      item = Item.create(name: item_name)
      self.items << item
    end
  end
end
