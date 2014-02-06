class List < ActiveRecord::Base

  attr_accessor :item_name
  before_save :add_item
  # before_update :add_item

  validates :name, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :items

  private

  def add_item 
    if self.item_name != "" && self.item_name
      # p "item?", self.item_name
      item = Item.new(name: item_name)
      self.items << item
    end
  end
end
