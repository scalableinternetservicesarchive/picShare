class AddVoteColumn < ActiveRecord::Migration
  def change
  	add_column :post_votes, :vote, :integer
  end
end
