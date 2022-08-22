class Post < ApplicationRecord
    validates :user_id, :content, :user_images, {presence: true}
end
