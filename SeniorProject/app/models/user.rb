class User < ApplicationRecord
    validates :fname, presence: true
    validates :lname, presence: true, length: { minimum: 2}
    validates :prename, presence: null
    validates :email, presence: true, length: { minimum: 4}
    validates :phonenumber, presence: true, length { minimum: 14}
end
