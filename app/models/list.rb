class List < ActiveRecord::Base
  belongs_to :User
  has_many :items

end
