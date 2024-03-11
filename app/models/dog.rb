class Dog < ApplicationRecord
    validates :dog_name, presence: true, length: {minimum: 5}
end