class Owner < ApplicationRecord
    validates :name, presence: true, length: {minimum: 5, maximum: 25}, uniqueness: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "format is invalid" }
end