class Post < ActiveRecord::Base
	belongs_to :user
	has_many :postVotes
	has_many :users, through: :postVotes

	validates :title, :description, :image_url, :upvotecount, :downvotecount, :postdate, presence: true
	validates :upvotecount, :downvotecount, numericality: {greater_than_or_equal_to: 0}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'Must be a URL for GIF, JPG, or PNG image'
	}
end

class PostVotes < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end