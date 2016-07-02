class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :comments, as: :commentable, dependent: :destroy

  validates :name,  presence: true
  validates :email, presence: true, email: true
end
