class Element < ActiveRecord::Base
  belongs_to :list
  validates :body, length: { maximum: 1, message: "must contain at least one character" }

end
