class User < ApplicationRecord
    include Visible

    has_many :degrees, dependent: :destroy
    has_many :awards, dependent: :destroy
    has_many :work, dependent: :destroy

    validates :fname, presence: true
    validates :lname, presence: true, length: { minimum: 2}
    validates :prename, allow_blank: true, length: {maximum: 8}
    validates :email, presence: true, length: { minimum: 4}
    validates :phonenumber, presence: true, length: { minimum: 14}

    VALID_STATUSES - ['public', 'private', 'archived']
    validates :status, inclusion: { in: VALID_STATUSES }

    def archived?
        status == 'archived'
    end
end
