class List < ActiveRecord::Base
  has_many :items
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :title
  validates :title, uniqueness: {scope: :user_id, message: "you already have a list with that title"}

  def json
    items = []
    self.items.each do |item|
      items << item.name 
    end
    {id: self.id, 
      list_name: self.title, 
      author_name: User.find(self.user_id),
      created_at: self.created_at,
      items: items}
  end
end
