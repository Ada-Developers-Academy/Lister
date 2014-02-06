class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :title
  validates :title, uniqueness: {scope: :user_id, message: "you already have a list with that title"}

  def json
    result = {}
    
  end
end
