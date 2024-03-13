class Owner < ApplicationRecord
    belongs_to :member
    before_validation { self.email = email.downcase}
    has_many :dogs
    validates :first_name, presence: true, 
            length: {minimum: 2, maximum: 25}
    validates :last_name, presence: true, 
            length: {minimum: 2, maximum: 25}
    validates :email, presence: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "format is invalid" }
    has_secure_password


end