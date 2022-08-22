class Post < ApplicationRecord
    validates :user_id, :content, {presence: true}
end
