class Comment < ActiveRecord::Base
  has_closure_tree
  
  belongs_to :user
  belongs_to :parent, class_name: Comment, foreign_key: :parent_id

  validates :message, presence: true
  validates :user_id, presence: true
end
