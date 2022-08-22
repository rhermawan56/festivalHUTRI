class User < ApplicationRecord
    has_secure_password
    validates :name, :email, :address, :password, {presence: true}
    validates :email, {uniqueness: true}
end
