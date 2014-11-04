class CreatePostVotes < ActiveRecord::Migration
  def change
	drop_table :postVotes

    create_table :post_votes do |t|
      t.belongs_to :user
      t.belongs_to :post
      
      t.timestamps
    end
  end
end
