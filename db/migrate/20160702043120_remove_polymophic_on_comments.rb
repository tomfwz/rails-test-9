class RemovePolymophicOnComments < ActiveRecord::Migration
  def change
    remove_reference :comments, :commentable, polymorphic: true, index: true
  end
end
