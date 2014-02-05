class List < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :title
  validates :title, uniqueness: {scope: :user_id, message: "you already have a list with that title"}
end
