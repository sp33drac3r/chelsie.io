class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :flags, as: :flaggable
  validates :body, presence: true
end
