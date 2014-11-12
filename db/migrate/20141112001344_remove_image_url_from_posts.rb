class RemoveImageUrlFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :image_url, :string
  end
end
