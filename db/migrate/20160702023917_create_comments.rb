class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text        :message
      t.references  :user, index: true
      t.references  :commentable, polymorphic: true, index: true
      t.integer     :parent_id
      
      t.timestamps
    end
  end
end
