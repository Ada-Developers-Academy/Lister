class List < ActiveRecord::
  belongs_to :user
  has_many :elements
end
