class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  has_many :comments, dependent: :destroy
  has_many :flags, as: :flaggable
  valdiates :title, presence: true
  valdiates :body, presence: true
end
