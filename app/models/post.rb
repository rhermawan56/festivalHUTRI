class Post < ApplicationRecord
    validates :user_id, :content, :user_images, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end
end
