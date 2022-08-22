class User < ApplicationRecord
    validates :name, :email, :address, :password, {presence: true}
    validates :email, {uniqueness: true}
end
