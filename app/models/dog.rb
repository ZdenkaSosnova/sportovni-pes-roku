class Dog < ApplicationRecord
    belongs_to :owner
    validates :dog_name, presence: true, length: {minimum: 5}
    validates :date_of_birth, presence: true
end