# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
userCount = 25000
postPrUserCount = 1
postVotesPrPostCount = 3
pic =File.open('/home/ec2-user/app/kitty.jpg')
(1..userCount).each do |i|
	user = User.create(email: i.to_s+'@mail.com', password: '12345678', password_confirmation: '12345678')
		(1..postPrUserCount).each do |j|
		p = Post.create(user_id: i, title:"Title!", description: "Desc_C3", image: pic, postdate: Time.now)
			(1..postVotesPrPostCount).each do |k|
			postVote = PostVote.create(user_id: (i+k)%userCount, post_id: p.id)
end
end
end