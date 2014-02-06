class List < ActiveRecord::Base
  validates_presence_of :name
  validates             :name, uniqueness: true
  has_many              :items

  def add_item(name)
    Item.create(name)
  end

end