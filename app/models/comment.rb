class Comment < ActiveRecord::Base  
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :message, presence: true
  validates :user_id, presence: true
end
