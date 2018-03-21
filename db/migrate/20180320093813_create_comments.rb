class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :commentable, polymorphic: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :comment_text

      t.timestamps null: false
    end
  end
end
