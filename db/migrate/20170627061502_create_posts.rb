class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :content
      t.string :image
      t.timestamps null: false
    end
  end
end
