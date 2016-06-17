class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :flags

  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
end
