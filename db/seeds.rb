# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
	{ email: 'testA@mail.com', password: '12345678', password_confirmation: '12345678'},
	{ email: 'testB@mail.com', password: '23456789', password_confirmation: '23456789'},
	{ email: 'testC@mail.com', password: '34567890', password_confirmation: '34567890'}])

posts = Post.create([
  {user_id: 1, title: "Tittel_A1", description: "Desc_A1", image_url: "a1.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 1, title: "Tittel_A2", description: "Desc_A2", image_url: "a2.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 1, title: "Tittel_A3", description: "Desc_A3", image_url: "a3.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},

  {user_id: 2, title: "Tittel_B1", description: "Desc_B1", image_url: "b1.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 2, title: "Tittel_B2", description: "Desc_B2", image_url: "b2.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 2, title: "Tittel_B3", description: "Desc_B3", image_url: "b3.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},

  {user_id: 3, title: "Tittel_C1", description: "Desc_C1", image_url: "c1.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 3, title: "Tittel_C2", description: "Desc_C2", image_url: "c2.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now},
  {user_id: 3, title: "Tittel_C3", description: "Desc_C3", image_url: "c3.jpg", upvotecount: 0, downvotecount: 0, postdate: Time.now}])

post_votes = PostVote.create([
	{user_id: 1, post_id: 4, vote: 0},
	{user_id: 1, post_id: 9, vote: 0},
	{user_id: 1, post_id: 7, vote: 0},
	{user_id: 2, post_id: 1, vote: 0},
	{user_id: 2, post_id: 3, vote: 0},
	{user_id: 2, post_id: 8, vote: 0},
	{user_id: 3, post_id: 2, vote: 0},
	{user_id: 3, post_id: 5, vote: 0},
	{user_id: 3, post_id: 6, vote: 0}])
