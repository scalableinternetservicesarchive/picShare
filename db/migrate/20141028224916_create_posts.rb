class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :upvotecount
      t.integer :downvotecount
      t.datetime :postdate
      t.integer :user_id

      t.timestamps
    end

    create_table :postVotes do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
