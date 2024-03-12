class Owner < ApplicationRecord
    before_save { self.email = email.downcase}
    before_save { self.name = name.titleize}
    has_many :dogs
    validates :name, presence: true, 
            length: {minimum: 5, maximum: 25},
            uniqueness: true
    validates :email, presence: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "format is invalid" }
end