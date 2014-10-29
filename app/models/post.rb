class Post < ActiveRecord::Base
	belongs_to :user
	has_many :postVotes
	has_many :users, through: :postVotes

	validates :title, :description, :image_url, :upvotecount, :downvotecount, :postdate, presence: true
	validates :upvotecount, :downvotecount, numericality: {greater_than_or_equal_to: 0}
end

class PostVotes < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end