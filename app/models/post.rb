class Post < ActiveRecord::Base
  belongs_to  :user
  has_many    :comments, as: :commentable, dependent: :destroy

  validates   :content, presence: true
  validates   :user_id, presence: true
end
