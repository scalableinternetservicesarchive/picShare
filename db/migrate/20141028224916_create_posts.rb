class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :upvotecount
      t.integer, :downvotecount
      t.datetime :postdate

      t.timestamps
    end
  end
end
