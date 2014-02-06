class Item < ActiveRecord::Base
  validates_presence_of name: {error: "can't be blank" }

  belongs_to :list

end