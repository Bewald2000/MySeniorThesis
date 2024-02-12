class User < ApplicationRecord
    validates :fname, presence: true
    validates :lname, presence: true, length: { minimum: 2}
    validates :prename, allow_blank: true, length: {maximum: 8}
    validates :email, presence: true, length: { minimum: 4}
    validates :phonenumber, presence: true, length: { minimum: 14}
end
