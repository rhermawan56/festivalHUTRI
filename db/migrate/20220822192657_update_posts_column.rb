class UpdatePostsColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :user_images, :string
    add_column :posts, :user_images, :string
  end
end
